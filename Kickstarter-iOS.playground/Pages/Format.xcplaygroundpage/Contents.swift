import UIKit
@testable import Library

// Currency symbol

Format.attributedCurrency(
  currencySymbol: "",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

// Amount

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 0,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

// Fraction digits

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 0,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 1,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 3,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 5,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

// Fonts

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_body(),
  superscriptFont: UIFont.ksr_title1(),
  foregroundColor: UIColor.cyan
)

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_title1(),
  foregroundColor: UIColor.cyan
)

// Foreground color

Format.attributedCurrency(
  currencySymbol: "CA$",
  amount: 99.975,
  fractionDigits: 2,
  font: UIFont.ksr_title1(),
  superscriptFont: UIFont.ksr_body(),
  foregroundColor: UIColor.red
)
