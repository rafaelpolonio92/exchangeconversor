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
    format = amount
    |>Float.to_string
    |>String.split(".")
    integer = Enum.at(format, 0)
    decimal = Enum.at(format, 1) || 00

    amountFormatted = %{
      integer: integer,
      decimal: decimal
    }
    amountFormatted
  end

  def parsedAmount(amount) do
    totalAmount = amountFormatter(amount)
    integerAmount = totalAmount.integer
    |> String.to_integer()
    decimalAmount = totalAmount.decimal
    |> decimalFormatter()
    { integerAmount, decimalAmount }
  end
  def exchangeConversion({ from, to, amount }) do
    currencies = currencyData()
    { integerAmount, decimalAmount } = parsedAmount(amount)
    exchangeRate = currencies[from]["rate"][to]
    |> Float.round(6)
    Math.pow(10,6)

    result = ((integerAmount * 100) + decimalAmount) * exchangeRate / Math.pow(10,8)
    result
  end

  def resultParser(result) do
    { integerAmount, decimalAmount } = parsedAmount(result)
    stringInteger = integerAmount
    stringDecimal = Integer.to_string(decimalAmount)
    joinedString = Enum.join([stringInteger, stringDecimal], ".")
    String.to_float(joinedString)
  end
  def formattedSplitValue({ integer, decimal, numberOfPersons }) do
    (((integer * 100) + decimal) / numberOfPersons) / 100
  end
end
