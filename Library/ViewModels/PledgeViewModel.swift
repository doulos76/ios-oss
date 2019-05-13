import KsApi
import Foundation
import Prelude
import ReactiveSwift
import Result

public typealias PledgeTableViewData = (amount: Double, currency: String, delivery: String, isLoggedIn: Bool)

public protocol PledgeViewModelInputs {
  func configureWith(project: Project, reward: Reward)
  func viewDidLoad()
}

public protocol PledgeViewModelOutputs {
  var selectedShippingRule: Signal<ShippingRule, NoError> { get }
  var reloadWithData: Signal<PledgeTableViewData, NoError> { get }
  var shippingIsLoading: Signal<Bool, NoError> { get }
}

public protocol PledgeViewModelType {
  var inputs: PledgeViewModelInputs { get }
  var outputs: PledgeViewModelOutputs { get }
}

public class PledgeViewModel: PledgeViewModelType, PledgeViewModelInputs, PledgeViewModelOutputs {
  public init() {
    let projectAndReward = Signal.combineLatest(
      self.configureProjectAndRewardProperty.signal, self.viewDidLoadProperty.signal
    )
      .map(first)
      .skipNil()

//    let shouldLoadShippingRules = projectAndReward.map { _, reward in reward.shipping.enabled }

    let shippingRulesEvent = projectAndReward
      .switchMap { (project, reward)
        -> SignalProducer<Signal<[ShippingRule], ErrorEnvelope>.Event, NoError> in
        // TODO: verify if this is the correct check we should be making
        guard reward.shipping.enabled else {
          return SignalProducer(value: .value([]))
        }

        return AppEnvironment.current.apiService.fetchRewardShippingRules(projectId: project.id,
                                                                          rewardId: reward.id)
          .ksr_delay(AppEnvironment.current.apiDelayInterval, on: AppEnvironment.current.scheduler)
          .map(ShippingRulesEnvelope.lens.shippingRules.view)
          .retry(upTo: 3)
          .materialize()
    }

    self.shippingIsLoading = Signal.merge(shippingRulesEvent.values().mapConst(false),
                                          shippingRulesEvent.errors().mapConst(false)
    )

    let defaultShippingRule = shippingRulesEvent.values()
      .map(defaultShippingRule(fromShippingRules:))

    self.selectedShippingRule = defaultShippingRule.skipNil()

    let isLoggedIn = projectAndReward
      .map { _ in AppEnvironment.current.currentUser }
      .map(isNotNil)

    let amountCurrencyDelivery = projectAndReward.signal
      .map { (project, reward) in
        (reward.minimum,
         currencySymbol(forCountry: project.country).trimmed(),
         reward.estimatedDeliveryOn
          .map { Format.date(secondsInUTC: $0, template: "MMMMyyyy", timeZone: UTCTimeZone) } ?? "") }

    self.reloadWithData = Signal.combineLatest(amountCurrencyDelivery, isLoggedIn)
      .map { amountCurrencyDelivery, isLoggedIn in
        let (amount, currency, delivery) = amountCurrencyDelivery

        return (amount, currency, delivery, isLoggedIn)
    }
  }

  private let configureProjectAndRewardProperty = MutableProperty<(Project, Reward)?>(nil)
  public func configureWith(project: Project, reward: Reward) {
    self.configureProjectAndRewardProperty.value = (project, reward)
  }

  private let viewDidLoadProperty = MutableProperty(())
  public func viewDidLoad() {
    self.viewDidLoadProperty.value = ()
  }

  public let selectedShippingRule: Signal<ShippingRule, NoError>
  public let reloadWithData: Signal<PledgeTableViewData, NoError>
  public let shippingIsLoading: Signal<Bool, NoError>

  public var inputs: PledgeViewModelInputs { return self }
  public var outputs: PledgeViewModelOutputs { return self }
}
