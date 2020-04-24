defmodule CurrencyConverter do
  import Currencies
  alias Decimal, as: D
  @moduledoc """
    This file contains all business logic`.
  """
  def decimalFormatter(decimal) do
    cond do
      String.length(decimal) > 2 ->
        formattedString = String.slice(decimal, 0, 2)
        String.to_integer(formattedString)
      String.length(decimal) == 1 ->
        String.to_integer("#{decimal}#{0}")
      true ->
        String.to_integer(decimal)
    end
  end

  def amountFormatter(amount) do
    format = amount
    |>D.to_string
    |>String.split(".")
    integer = Enum.at(format, 0)
    decimal = Enum.at(format, 1) || "00"
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
    amount = D.cast(amount)
    { integerAmount, decimalAmount } = parsedAmount(amount)
    rate = currencies[from]["rate"][to]
    |> D.cast()
    |> D.round(6)
    |> D.mult(Math.pow(10, 6))
    |> D.reduce()
    |> D.to_integer()
    result = ((integerAmount * 100) + decimalAmount) * rate / Math.pow(10,8)
    |> Float.round(2)
    result
  end

  def formattedSplitValue({ integer, decimal, numberOfPersons }) do
    (((integer * 100) + decimal) / numberOfPersons) / 100
    |> Float.round(4)
  end
end
