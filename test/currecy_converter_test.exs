defmodule CurrecyConverterTest do
  use ExUnit.Case
  doctest CurrencyConverter

  test "currency conversion result" do
    assert CurrencyConverter.exchange_conversion({"BRL", "AUD", 3.93}) == 1.14
  end

  test "decimalFormatter slicing result if floating point has more then 2 numbers after ." do
    assert CurrencyConverter.decimal_formatter("12321312") == 12
  end

  test "testing parsedAmount" do
    assert CurrencyConverter.parsed_amount(13.51321) == {13, 51}
  end
end
