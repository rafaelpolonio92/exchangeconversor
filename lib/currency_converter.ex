defmodule CurrencyConverter do
  import Currencies
  @moduledoc """
    This file contains all business logic`.
  """
  def decimalFormatter(decimal) do
    if String.length(decimal) > 2 do
      formattedString = String.slice(decimal, 0, 2)
      String.to_integer(formattedString)
    else
      String.to_integer(decimal)
    end

  end

  def amountFormatter(amount) do
    stringAmount = Float.to_string(amount)
    splittedAmount = String.split(stringAmount, ".")
    integer = Enum.at(splittedAmount, 0)
    decimal = Enum.at(splittedAmount, 1) || 0
    amountFormatted = %{
      integer: integer,
      decimal: decimal
    }
    amountFormatted
  end

  def parsedAmount(amount) do
    totalAmount = amountFormatter(amount)
    integerAmount = decimalFormatter(totalAmount.integer)
    decimalAmount = decimalFormatter(totalAmount.decimal)
    { integerAmount, decimalAmount }
  end
  def exchangeConversion({ from, to, amount }) do
    currencies = currencyData()
    { integerAmount, decimalAmount } = parsedAmount(amount)
    from = String.to_atom(from)
    to = String.to_atom(to)
    exchangeRate = get_in(currencies, [from, :rate, to]) * Math.pow(10,6)
    result = ((integerAmount * 100) + decimalAmount) * exchangeRate / Math.pow(10,8)
    result
  end

  def conversor({ integer, decimal, exchangeRate }) do
    ((integer * 100) + decimal) * exchangeRate / Math.pow(10,8)
  end

  def formattedSplitValue({ integer, decimal, numberOfPersons }) do
    (((integer * 100) + decimal) / numberOfPersons) / 100
  end
end
