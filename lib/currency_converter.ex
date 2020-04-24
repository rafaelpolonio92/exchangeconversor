defmodule CurrencyConverter do
  import Currencies
  alias Decimal, as: D
  @moduledoc """
    This file contains all business logic`.
    We are converting the results from decimal to float for a better visualization in the screen
    Ex: 3.17 instead #Decimal<3.17>
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
    formattedAmount = amount
    |>D.to_string
    |>String.split(".")
    integer = Enum.at(formattedAmount, 0)
    decimal = Enum.at(formattedAmount, 1) || "00"
    amountFormatted = %{
      "integer" => integer,
      "decimal" => decimal
    }
    amountFormatted
  end

  def parsedAmount(amount) do
    decimalAmount = D.cast(amount)
    totalAmount = amountFormatter(decimalAmount)
    integerAmount = totalAmount["integer"]
    |> String.to_integer()
    decimalAmount = totalAmount["decimal"]
    |> decimalFormatter()
    { integerAmount, decimalAmount }
  end

  def exchangeConversion({ from, to, amount }) do
    currencies = currencyData()
    { integerAmount, decimalAmount } = parsedAmount(amount)
    rate = currencies[from |> String.upcase()]["rate"][to |> String.upcase()]
    |> D.cast()
    |> D.round(6)
    |> D.mult(Math.pow(10, 6))
    |> D.reduce()
    |> D.to_integer()
    result = ((integerAmount * 100) + decimalAmount) * rate / Math.pow(10,8)
    |> D.cast()
    |> D.round(2)
    result
    # Converting the decimal result to from decimal o float for a better result visualization
    |> D.to_float()
  end

  def formattedSplitValue({ integer, decimal, numberOfPersons }) do
    (((integer * 100) + decimal) / numberOfPersons) / 100
    |> D.cast()
    |> D.round(2)
      # Converting the decimal result to from decimal o float for a better result visualization
    |> D.to_float()
  end
end
