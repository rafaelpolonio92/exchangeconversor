defmodule CurrecyConverterTest do
  use ExUnit.Case
  doctest CurrencyController
  doctest CurrencyConverter

  test "currency conversion result" do
    assert CurrencyController.currencyConverter({ "BRL", "AUD", 3.93 }) == 1.13
  end

  test "amountFormatter formatting result" do
    assert CurrencyConverter.amountFormatter(23.561231) == %{
      integer: "23",
      decimal: "561231"
    }
  end

  test "decimalFormatter slicing result if floating point has more then 2 numbers after ." do
    assert CurrencyConverter.decimalFormatter("12321312") == 12
  end

  test "testing parsedAmount" do
    assert CurrencyConverter.parsedAmount(13.51321) == { 13, 51 }
  end
end
