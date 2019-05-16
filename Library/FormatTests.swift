import XCTest
import KsApi
@testable import Library

final class FormatTests: TestCase {

  func testWholeNumber() {
    withEnvironment(locale: Locale(identifier: "en")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1,000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10,000")
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1.000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10.000")
    }

    withEnvironment(locale: Locale(identifier: "fr")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1 000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10 000")
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1.000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10.000")
    }

    withEnvironment(locale: Locale(identifier: "ja")) {
      XCTAssertEqual(Format.wholeNumber(10), "10")
      XCTAssertEqual(Format.wholeNumber(100), "100")
      XCTAssertEqual(Format.wholeNumber(1_000), "1,000")
      XCTAssertEqual(Format.wholeNumber(10_000), "10,000")
    }
  }

  func testPercentages() {

    withEnvironment(locale: Locale(identifier: "en")) {
      XCTAssertEqual(Format.percentage(50), "50%")
      XCTAssertEqual(Format.percentage(1_000), "1,000%")
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1.000 %")
    }

    withEnvironment(locale: Locale(identifier: "fr")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1 000 %")
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      XCTAssertEqual(Format.percentage(50), "50 %")
      XCTAssertEqual(Format.percentage(1_000), "1.000 %")
    }

    withEnvironment(locale: Locale(identifier: "ja")) {
      XCTAssertEqual(Format.percentage(50), "50%")
      XCTAssertEqual(Format.percentage(1_000), "1,000%")
    }
  }

  func testPercentageFromDouble() {
    withEnvironment(locale: Locale(identifier: "en")) {
      XCTAssertEqual(Format.percentage(0.532), "53%")
      XCTAssertEqual(Format.percentage(10.66), "1,066%")
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1.066 %")
    }

    withEnvironment(locale: Locale(identifier: "fr")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1 066 %")
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      XCTAssertEqual(Format.percentage(0.532), "53 %")
      XCTAssertEqual(Format.percentage(10.66), "1.066 %")
    }

    withEnvironment(locale: Locale(identifier: "ja")) {
      XCTAssertEqual(Format.percentage(0.532), "53%")
      XCTAssertEqual(Format.percentage(10.66), "1,066%")
    }
  }

  func testCurrency() {
    withEnvironment(locale: Locale(identifier: "en")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "$1,000")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "CA$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "DKK 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .de), "€1,000")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "¥1,000")

        XCTAssertEqual(Format.currency(1_000, country: .ca, omitCurrencyCode: true), "CA$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .ca, omitCurrencyCode: false), "CA$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .us, omitCurrencyCode: true), "$1,000")
        XCTAssertEqual(Format.currency(1_000, country: .us, omitCurrencyCode: false), "US$ 1,000")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "US$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "CA$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "DKK 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .de), "€1,000")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "¥1,000")

        XCTAssertEqual(Format.currency(1_000, country: .us, omitCurrencyCode: true), "US$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .us, omitCurrencyCode: false), "US$ 1,000")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "US$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "CA$ 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "£1,000")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "DKK 1,000")
        XCTAssertEqual(Format.currency(1_000, country: .de), "€1,000")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "¥1,000")
      }
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 $")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }
    }

    withEnvironment(locale: Locale(identifier: "fr")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1 000 $")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1 000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1 000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1 000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1 000 ¥")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1 000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1 000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1 000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1 000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1 000 ¥")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1 000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1 000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1 000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1 000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1 000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1 000 ¥")
      }
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 $")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }
    }

    withEnvironment(locale: Locale(identifier: "jp")) {
      withEnvironment(countryCode: "DK") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "US$ 1000")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "CA$ 1000")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "£ 1000")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "DKK 1000")
        XCTAssertEqual(Format.currency(1_000, country: .de), "€ 1000")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "¥ 1000")
      }
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      withEnvironment(countryCode: "US") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 $")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "CA") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }

      withEnvironment(countryCode: "GB") {
        XCTAssertEqual(Format.currency(1_000, country: .us), "1.000 US$")
        XCTAssertEqual(Format.currency(1_000, country: .ca), "1.000 CA$")
        XCTAssertEqual(Format.currency(1_000, country: .gb), "1.000 £")
        XCTAssertEqual(Format.currency(1_000, country: .dk), "1.000 DKK")
        XCTAssertEqual(Format.currency(1_000, country: .de), "1.000 €")
        XCTAssertEqual(Format.currency(1_000, country: .jp), "1.000 ¥")
      }
    }
  }

  func testAttributedCurrency_Symbol_NoSymbol() {
    let currencySymbol = ""
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 99.975,
      fractionDigits: 2,
      font: UIFont.ksr_title1(),
      superscriptFont: UIFont.ksr_body(),
      foregroundColor: UIColor.cyan
    )
    let range = NSRange(location: 0, length: currencySymbol.count)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)

    XCTAssertEqual("99.97", attributedCurrency?.string)
    XCTAssertEqual(0, attributedSubstring?.length)
  }

  func testAttributedCurrency_Symbol_SimpleSymbol() {
    let currencySymbol = "$"
    let font = UIFont.ksr_title1()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 99.975,
      fractionDigits: 2,
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: currencySymbol.count)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    let offset = font.capHeight - superscriptFont.capHeight

    XCTAssertEqual("$99.97", attributedCurrency?.string)
    XCTAssertEqual(currencySymbol, attributedSubstring?.string)
    XCTAssertEqual(superscriptFont, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, (attributes?[NSAttributedString.Key.baselineOffset]) as? CGFloat)
  }

  func testAttributedCurrency_Symbol_CustomSymbol() {
    let currencySymbol = "CA$"
    let font = UIFont.ksr_title1()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 99.975,
      fractionDigits: 2,
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: currencySymbol.count)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    let offset = font.capHeight - superscriptFont.capHeight

    XCTAssertEqual("CA$99.97", attributedCurrency?.string)
    XCTAssertEqual(currencySymbol, attributedSubstring?.string)
    XCTAssertEqual(superscriptFont, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, attributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }

  func testAttributedCurrency_Amount_Zero() {
    let font = UIFont.ksr_title1()
    let foregroundColor = UIColor.cyan
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "",
      amount: 0,
      fractionDigits: 2,
      font: font,
      superscriptFont: UIFont.ksr_body(),
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: 1)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("0.00", attributedCurrency?.string)
    XCTAssertEqual("0", attributedSubstring?.string)
    XCTAssertEqual(font, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  func testAttributedCurrency_Amount_NonZero() {
    let font = UIFont.ksr_title1()
    let foregroundColor = UIColor.cyan
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "",
      amount: 199,
      fractionDigits: 2,
      font: font,
      superscriptFont: UIFont.ksr_body(),
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: 3)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("199.00", attributedCurrency?.string)
    XCTAssertEqual("199", attributedSubstring?.string)
    XCTAssertEqual(font, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  func testAttributedCurrency_FractionDigits_Zero() {
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 0
    let fractionDigitsPlusSeparator = 0
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "",
      amount: 1.2755,
      fractionDigits: UInt(fractionDigits),
      font: UIFont.ksr_title1(),
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)

    XCTAssertEqual("1", attributedCurrency?.string)
    XCTAssertEqual(0, attributedSubstring?.length)
  }

  func testAttributedCurrency_FractionDigits_Two() {
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 2
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "",
      amount: 1.2755,
      fractionDigits: UInt(fractionDigits),
      font: UIFont.ksr_title1(),
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: 1, length: fractionDigitsPlusSeparator)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("1.27", attributedCurrency?.string)
    XCTAssertEqual(".27", attributedSubstring?.string)
    XCTAssertEqual(superscriptFont, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  func testAttributedCurrency_FractionDigits_Ten() {
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 10
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "",
      amount: 1.2755,
      fractionDigits: UInt(fractionDigits),
      font: UIFont.ksr_title1(),
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: 1, length: fractionDigitsPlusSeparator)
    let attributedSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let attributes = attributedSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("1.2755000000", attributedCurrency?.string)
    XCTAssertEqual(".2755000000", attributedSubstring?.string)
    XCTAssertEqual(superscriptFont, attributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  // swiftlint:disable line_length
  func testAttributedCurrency_BaselineOffset_FontLargerThanSuperscriptFont() {
    let currencySymbol = "CZK"
    let font = UIFont.ksr_title1()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 1
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 14.99,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: 0, length: currencySymbol.count)
    let attributedCurrencySubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: currencySymbol.count + 2, length: fractionDigitsPlusSeparator)
    let attributedFractionSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let currencyAttributes = attributedCurrencySubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let fractionAttributes = attributedFractionSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    let offset = font.capHeight - superscriptFont.capHeight

    XCTAssertEqual("CZK14.9", attributedCurrency?.string)
    XCTAssertEqual("CZK", attributedCurrencySubstring?.string)
    XCTAssertEqual(".9", attributedFractionSubstring?.string)
    XCTAssertEqual(superscriptFont, currencyAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, currencyAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, currencyAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
    XCTAssertEqual(superscriptFont, fractionAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, fractionAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, fractionAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }

  func testAttributedCurrency_BaselineOffset_FontSmallerThanSuperscriptFont() {
    let currencySymbol = "CZK"
    let font = UIFont.ksr_body()
    let superscriptFont = UIFont.ksr_title1()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 1
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 14.99,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: 0, length: currencySymbol.count)
    let attributedCurrencySubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: currencySymbol.count + 2, length: fractionDigitsPlusSeparator)
    let attributedFractionSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let currencyAttributes = attributedCurrencySubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let fractionAttributes = attributedFractionSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("CZK14.9", attributedCurrency?.string)
    XCTAssertEqual("CZK", attributedCurrencySubstring?.string)
    XCTAssertEqual(".9", attributedFractionSubstring?.string)
    XCTAssertEqual(superscriptFont, currencyAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, currencyAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(0, currencyAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
    XCTAssertEqual(superscriptFont, fractionAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, fractionAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(0, fractionAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }

  func testAttributedCurrency_BaselineOffset_FontEqualToSuperscriptFont() {
    let currencySymbol = "CZK"
    let font = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 1
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 14.99,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: font,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: 0, length: currencySymbol.count)
    let attributedCurrencySubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: currencySymbol.count + 2, length: fractionDigitsPlusSeparator)
    let attributedFractionSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let currencyAttributes = attributedCurrencySubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let fractionAttributes = attributedFractionSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("CZK14.9", attributedCurrency?.string)
    XCTAssertEqual("CZK", attributedCurrencySubstring?.string)
    XCTAssertEqual(".9", attributedFractionSubstring?.string)
    XCTAssertEqual(font, currencyAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, currencyAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(0, currencyAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
    XCTAssertEqual(font, fractionAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, fractionAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(0, fractionAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }

  func testAttributedCurrency_ForegroundColor() {
    let foregroundColor = UIColor.red
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: "CA$",
      amount: 9.99,
      fractionDigits: 2,
      font: UIFont.ksr_title1(),
      superscriptFont: UIFont.ksr_body(),
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: attributedCurrency?.length ?? 0)
    let attributes = attributedCurrency?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("CA$9.99", attributedCurrency?.string)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  func testAttributedCurrency_Combined_Currency_NoSymbol_Amount_Zero_FractionDigits_Zero() {
    let currencySymbol = ""
    let font = UIFont.ksr_title2()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 0
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 0,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    let range = NSRange(location: 0, length: attributedCurrency?.length ?? 0)
    let attributes = attributedCurrency?.attributes(at: 0, longestEffectiveRange: nil, in: range)

    XCTAssertEqual("0", attributedCurrency?.string)
    XCTAssertEqual(foregroundColor, attributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
  }

  func testAttributedCurrency_Combined_Currency_SimpleSymbol_Amount_NonZero_FractionDigits_Two() {
    let currencySymbol = "¥"
    let font = UIFont.ksr_title2()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.cyan
    let fractionDigits = 2
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 10.0025,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: currencySymbol.count, length: 2)
    let attributedAmountSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let attributedCurrencySubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: currencySymbol.count + 2, length: fractionDigitsPlusSeparator)
    let attributedFractionSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let currencyAttributes = attributedCurrencySubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: 2)
    let amountAttributes = attributedAmountSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let fractionAttributes = attributedFractionSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    let offset = font.capHeight - superscriptFont.capHeight

    XCTAssertEqual("¥10.00", attributedCurrency?.string)
    XCTAssertEqual("¥", attributedCurrencySubstring?.string)
    XCTAssertEqual(".00", attributedFractionSubstring?.string)
    XCTAssertEqual(superscriptFont, currencyAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, currencyAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, currencyAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
    XCTAssertEqual(font, amountAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, amountAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(superscriptFont, fractionAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, fractionAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, fractionAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }

  func testAttributedCurrency_Combined_Currency_CustomSymbol_Amount_NonZero_FractionDigits_Five() {
    let currencySymbol = "CZK"
    let font = UIFont.ksr_title2()
    let superscriptFont = UIFont.ksr_body()
    let foregroundColor = UIColor.blue
    let fractionDigits = 5
    let fractionDigitsPlusSeparator = fractionDigits + 1
    let attributedCurrency = Format.attributedCurrency(
      currencySymbol: currencySymbol,
      amount: 100.0025,
      fractionDigits: UInt(fractionDigits),
      font: font,
      superscriptFont: superscriptFont,
      foregroundColor: foregroundColor
    )
    var range = NSRange(location: currencySymbol.count, length: 3)
    let attributedAmountSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let attributedCurrencySubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: currencySymbol.count + 3, length: fractionDigitsPlusSeparator)
    let attributedFractionSubstring = attributedCurrency?.attributedSubstring(from: range)
    range = NSRange(location: 0, length: currencySymbol.count)
    let currencyAttributes = attributedCurrencySubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: 3)
    let amountAttributes = attributedAmountSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    range = NSRange(location: 0, length: fractionDigitsPlusSeparator)
    let fractionAttributes = attributedFractionSubstring?.attributes(at: 0, longestEffectiveRange: nil, in: range)
    let offset = font.capHeight - superscriptFont.capHeight

    XCTAssertEqual("CZK100.00250", attributedCurrency?.string)
    XCTAssertEqual("CZK", attributedCurrencySubstring?.string)
    XCTAssertEqual(".00250", attributedFractionSubstring?.string)
    XCTAssertEqual(superscriptFont, currencyAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, currencyAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, currencyAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
    XCTAssertEqual(font, amountAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, amountAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(superscriptFont, fractionAttributes?[NSAttributedString.Key.font] as? UIFont)
    XCTAssertEqual(foregroundColor, fractionAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor)
    XCTAssertEqual(offset, fractionAttributes?[NSAttributedString.Key.baselineOffset] as? CGFloat)
  }
  // swiftlint:enable line_length

  func testDate() {
    let date = 434592000.0 // Oct 10 1983 in UTC
    // swiftlint:disable force_unwrapping
    let UTC = TimeZone(abbreviation: "UTC")!
    let EST = TimeZone(abbreviation: "EST")!
    // swiftlint:enable force_unwrapping
    var calUTC = Calendar.current
    calUTC.timeZone = UTC
    var calEST = Calendar.current
    calEST.timeZone = EST

    withEnvironment(locale: Locale(identifier: "en")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "Oct 10, 1983 at 12:00:00 AM")
      }

      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "Oct 9, 1983 at 8:00:00 PM")
      }
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "10.10.1983, 00:00:00")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "09.10.1983, 20:00:00")
      }
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "10 oct 1983 0:00:00")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "9 oct 1983 20:00:00")
      }
    }

    withEnvironment(locale: Locale(identifier: "ja")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "1983/10/10 0:00:00")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date), "1983/10/09 20:00:00")
      }
    }

    let ios10 = OperatingSystemVersion(majorVersion: 10, minorVersion: 0, patchVersion: 0)
    if ProcessInfo().isOperatingSystemAtLeast(ios10) {
      withEnvironment(locale: Locale(identifier: "fr")) {
        withEnvironment(calendar: calUTC) {
          XCTAssertEqual(Format.date(secondsInUTC: date), "10 oct. 1983 à 00:00:00")
        }
        withEnvironment(calendar: calEST) {
          XCTAssertEqual(Format.date(secondsInUTC: date), "9 oct. 1983 à 20:00:00")
        }
      }
    } else {
      withEnvironment(locale: Locale(identifier: "fr")) {
        withEnvironment(calendar: calUTC) {
          XCTAssertEqual(Format.date(secondsInUTC: date), "10 oct. 1983 00:00:00")
        }
        withEnvironment(calendar: calEST) {
          XCTAssertEqual(Format.date(secondsInUTC: date), "9 oct. 1983 20:00:00")
        }
      }
    }
  }

  func testDateWithDateFormat() {
    let date = 434592000.0 // Oct 10 1983 in UTC
    // swiftlint:disable force_unwrapping
    let UTC = TimeZone(abbreviation: "UTC")!
    let EST = TimeZone(abbreviation: "EST")!
    // swiftlint:enable force_unwrapping
    let format = "MMMyyyy"
    var calUTC = Calendar.current
    calUTC.timeZone = UTC
    var calEST = Calendar.current
    calEST.timeZone = EST

    withEnvironment(locale: Locale(identifier: "en")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "Oct 1983")
      }

      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "Oct 1983")
      }
    }

    withEnvironment(locale: Locale(identifier: "de")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "Okt. 1983")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "Okt. 1983")
      }
    }

    withEnvironment(locale: Locale(identifier: "es")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "oct 1983")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "oct 1983")
      }
    }

    withEnvironment(locale: Locale(identifier: "fr")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "oct. 1983")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "oct. 1983")
      }
    }

    withEnvironment(locale: Locale(identifier: "ja")) {
      withEnvironment(calendar: calUTC) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "1983年10月")
      }
      withEnvironment(calendar: calEST) {
        XCTAssertEqual(Format.date(secondsInUTC: date, template: format), "1983年10月")
      }
    }
  }

  func testDateFromString() {
    let format = "yyyy-MM"
    let dateString = "2018-01"
    let timeZone = UTCTimeZone
    let PST = TimeZone(abbreviation: "PST")
    // swiftlint:disable:next force_unwrapping
    let EST = TimeZone(abbreviation: "EST")!
    var calEST = Calendar.current
    calEST.timeZone = EST

    withEnvironment(calendar: calEST) {
      let date = Format.date(from: dateString, dateFormat: format, timeZone: timeZone)
      XCTAssertEqual(date?.description, "2018-01-01 00:00:00 +0000")
    }

    withEnvironment(calendar: calEST) {
      let date = Format.date(from: dateString, dateFormat: format)
      XCTAssertEqual(date?.description, "2018-01-01 05:00:00 +0000")
    }

    withEnvironment {
      let date = Format.date(from: dateString, dateFormat: format, timeZone: PST)
      XCTAssertEqual(date?.description, "2018-01-01 08:00:00 +0000")
    }
  }

  func testDuration() {
    let now = self.dateType.init()
    let thirtyMins = now.timeIntervalSince1970 + 60 * 30
    let oneDay = now.timeIntervalSince1970 + 60 * 60 * 24
    let twoDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 2
    let oneAndAHalfDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 1.5
    let sixDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 6
    let sixDaysPast = now.timeIntervalSince1970 - 60 * 60 * 24 * 6

    XCTAssertEqual("30", Format.duration(secondsInUTC: thirtyMins).time)
    XCTAssertEqual("minutes", Format.duration(secondsInUTC: thirtyMins).unit)

    XCTAssertEqual("24", Format.duration(secondsInUTC: oneDay).time)
    XCTAssertEqual("hours", Format.duration(secondsInUTC: oneDay).unit)

    XCTAssertEqual("36", Format.duration(secondsInUTC: oneAndAHalfDays).time)
    XCTAssertEqual("hours", Format.duration(secondsInUTC: oneAndAHalfDays).unit)

    XCTAssertEqual("6", Format.duration(secondsInUTC: sixDays).time)
    XCTAssertEqual("days", Format.duration(secondsInUTC: sixDays).unit)

    XCTAssertEqual("0", Format.duration(secondsInUTC: sixDaysPast).time)
    XCTAssertEqual("secs", Format.duration(secondsInUTC: sixDaysPast).unit)

    withEnvironment(language: .ja, locale: Locale(identifier: "ja"), mainBundle: MockBundle()) {
      XCTAssertEqual("2", Format.duration(secondsInUTC: twoDays).time)
      XCTAssertEqual("日", Format.duration(secondsInUTC: twoDays).unit)
    }
  }

  func testDurationAbbreviated() {
    let now = self.dateType.init()
    let thirtyMins = now.timeIntervalSince1970 + 60 * 30
    let oneDay = now.timeIntervalSince1970 + 60 * 60 * 24
    let oneAndAHalfDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 1.5
    let sixDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 6
    let sixDaysPast = now.timeIntervalSince1970 - 60 * 60 * 24 * 6

    XCTAssertEqual("30", Format.duration(secondsInUTC: thirtyMins, abbreviate: true).time)
    XCTAssertEqual("mins", Format.duration(secondsInUTC: thirtyMins, abbreviate: true).unit)

    XCTAssertEqual("24", Format.duration(secondsInUTC: oneDay, abbreviate: true).time)
    XCTAssertEqual("hrs", Format.duration(secondsInUTC: oneDay, abbreviate: true).unit)

    XCTAssertEqual("36", Format.duration(secondsInUTC: oneAndAHalfDays, abbreviate: true).time)
    XCTAssertEqual("hrs", Format.duration(secondsInUTC: oneAndAHalfDays, abbreviate: true).unit)

    XCTAssertEqual("6", Format.duration(secondsInUTC: sixDays, abbreviate: true).time)
    XCTAssertEqual("days", Format.duration(secondsInUTC: sixDays, abbreviate: true).unit)

    XCTAssertEqual("0", Format.duration(secondsInUTC: sixDaysPast, abbreviate: true).time)
    XCTAssertEqual("secs", Format.duration(secondsInUTC: sixDaysPast, abbreviate: true).unit)
  }

  func testDurationUsingToGo() {
    let now = self.dateType.init()
    let thirtyMins = now.timeIntervalSince1970 + 60 * 30
    let oneMinute = now.timeIntervalSince1970 + 60
    let oneDay = now.timeIntervalSince1970 + 60 * 60 * 24
    let oneAndAHalfDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 1.5
    let sixDays = now.timeIntervalSince1970 + 60 * 60 * 24 * 6
    let sixDaysPast = now.timeIntervalSince1970 - 60 * 60 * 24 * 6

    XCTAssertEqual("30", Format.duration(secondsInUTC: thirtyMins, useToGo: true).time)
    XCTAssertEqual("minutes to go", Format.duration(secondsInUTC: thirtyMins, useToGo: true).unit)

    XCTAssertEqual("1", Format.duration(secondsInUTC: oneMinute, useToGo: true).time)
    XCTAssertEqual("minute to go", Format.duration(secondsInUTC: oneMinute, useToGo: true).unit)

    XCTAssertEqual("24", Format.duration(secondsInUTC: oneDay, useToGo: true).time)
    XCTAssertEqual("hours to go", Format.duration(secondsInUTC: oneDay, useToGo: true).unit)

    XCTAssertEqual("36", Format.duration(secondsInUTC: oneAndAHalfDays, useToGo: true).time)
    XCTAssertEqual("hours to go", Format.duration(secondsInUTC: oneAndAHalfDays, useToGo: true).unit)

    XCTAssertEqual("6", Format.duration(secondsInUTC: sixDays, useToGo: true).time)
    XCTAssertEqual("days to go", Format.duration(secondsInUTC: sixDays, useToGo: true).unit)

    XCTAssertEqual("0", Format.duration(secondsInUTC: sixDaysPast, useToGo: true).time)
    XCTAssertEqual("secs to go", Format.duration(secondsInUTC: sixDaysPast, useToGo: true).unit)
  }

  func testRelative() {
    let now = self.dateType.init()
    let justNow = now.timeIntervalSince1970 - 30
    let rightNow = now.timeIntervalSince1970 + 30
    let minutesAgo = now.timeIntervalSince1970 - (60 * 30)
    let inMinutes = now.timeIntervalSince1970 + (60 * 30)
    let hoursAgo = now.timeIntervalSince1970 - (60 * 60)
    let inHours = now.timeIntervalSince1970 + (60 * 60)
    let yesterday = now.timeIntervalSince1970 - (60 * 60 * 24)
    let tomorrow = now.timeIntervalSince1970 + (60 * 60 * 24)
    let daysAgo = now.timeIntervalSince1970 - (60 * 60 * 24 * 2)
    let inDays = now.timeIntervalSince1970 + (60 * 60 * 24 * 2)
    let awhileAgo = now.timeIntervalSince1970 - (60 * 60 * 24 * 30 + 60 * 60 * 24)
    let inAwhile = now.timeIntervalSince1970 + (60 * 60 * 24 * 30 + 60 * 60 * 24)

    withEnvironment(language: .en, locale: Locale(identifier: "en"), mainBundle: MockBundle()) {
      XCTAssertEqual("just now", Format.relative(secondsInUTC: justNow))
      XCTAssertEqual("right now", Format.relative(secondsInUTC: rightNow))
      XCTAssertEqual("30 minutes ago", Format.relative(secondsInUTC: minutesAgo))
      XCTAssertEqual("in 30 minutes", Format.relative(secondsInUTC: inMinutes))
      XCTAssertEqual("1 hour ago", Format.relative(secondsInUTC: hoursAgo))
      XCTAssertEqual("in 1 hour", Format.relative(secondsInUTC: inHours))
      XCTAssertEqual("yesterday", Format.relative(secondsInUTC: yesterday))
      XCTAssertEqual("in 1 day", Format.relative(secondsInUTC: tomorrow))
      XCTAssertEqual("2 days ago", Format.relative(secondsInUTC: daysAgo))
      XCTAssertEqual("in 2 days", Format.relative(secondsInUTC: inDays))
      XCTAssertEqual(Format.date(secondsInUTC: awhileAgo, timeStyle: .none),
                     Format.relative(secondsInUTC: awhileAgo))
      XCTAssertEqual(Format.date(secondsInUTC: inAwhile, timeStyle: .none),
                     Format.relative(secondsInUTC: inAwhile))

      XCTAssertEqual("just now", Format.relative(secondsInUTC: justNow, abbreviate: true))
      XCTAssertEqual("right now", Format.relative(secondsInUTC: rightNow, abbreviate: true))
      XCTAssertEqual("30 mins ago", Format.relative(secondsInUTC: minutesAgo, abbreviate: true))
      XCTAssertEqual("in 30 mins", Format.relative(secondsInUTC: inMinutes, abbreviate: true))
      XCTAssertEqual("1 hr ago", Format.relative(secondsInUTC: hoursAgo, abbreviate: true))
      XCTAssertEqual("in 1 hr", Format.relative(secondsInUTC: inHours, abbreviate: true))
      XCTAssertEqual("yesterday", Format.relative(secondsInUTC: yesterday, abbreviate: true))
      XCTAssertEqual("in 1 day", Format.relative(secondsInUTC: tomorrow, abbreviate: true))
      XCTAssertEqual("2 days ago", Format.relative(secondsInUTC: daysAgo, abbreviate: true))
      XCTAssertEqual("in 2 days", Format.relative(secondsInUTC: inDays, abbreviate: true))
      XCTAssertEqual(Format.date(secondsInUTC: awhileAgo, timeStyle: .none),
                     Format.relative(secondsInUTC: awhileAgo, abbreviate: true))
      XCTAssertEqual(Format.date(secondsInUTC: inAwhile, timeStyle: .none),
                     Format.relative(secondsInUTC: inAwhile, abbreviate: true))
    }

    withEnvironment(language: .de, locale: Locale(identifier: "de"), mainBundle: MockBundle()) {
      XCTAssertEqual("vor 1 Stunde", Format.relative(secondsInUTC: hoursAgo))
      XCTAssertEqual("vor 1 Std", Format.relative(secondsInUTC: hoursAgo, abbreviate: true))
    }
  }
}
