defmodule CurrencyConverter do
  import Currencies
  alias Decimal, as: D

  @moduledoc """
    This file contains all business logic`.
    We are converting the results from decimal to float for a better visualization in the screen
    Ex: 3.17 instead #Decimal<3.17>
  """
  def decimal_formatter(decimal) do
    cond do
      String.length(decimal) > 2 ->
        formatted_string = String.slice(decimal, 0, 2)
        String.to_integer(formatted_string)

      String.length(decimal) == 1 ->
        String.to_integer("#{decimal}#{0}")

      true ->
        String.to_integer(decimal)
    end
  end

  def amount_formatter(amount) do
    string_amount =
      amount
      |> D.to_string()
      |> String.split(".")

    integer = Enum.at(string_amount, 0)
    decimal = Enum.at(string_amount, 1) || "00"

    amount_formatted = %{
      "integer" => integer,
      "decimal" => decimal
    }

    amount_formatted
  end

  def parsed_amount(amount) do
    decimal_amount = D.cast(amount)
    total_amount = amount_formatter(decimal_amount)

    formatted_integer_amount =
      total_amount["integer"]
      |> String.to_integer()

    formatted_decimal_amount =
      total_amount["decimal"]
      |> decimal_formatter()

    {formatted_integer_amount, formatted_decimal_amount}
  end

  def exchange_conversion({from, to, amount}) do
    currencies = currency_data()
    {formatted_integer_amount, formatted_decimal_amount} = parsed_amount(amount)

    rate =
      currencies[from |> String.upcase()]["rate"][to |> String.upcase()]
      |> D.cast()
      |> D.round(6)
      |> D.mult(Math.pow(10, 6))
      |> D.reduce()
      |> D.to_integer()

    result =
      ((formatted_integer_amount * 100 + formatted_decimal_amount) * rate / Math.pow(10, 8))
      |> D.cast()
      |> D.round(2)

    result
    # Converting the decimal result to from decimal o float for a better result visualization
    |> D.to_float()
  end

  def formatted_split_value({integer, decimal, number_of_persons}) do
    ((integer * 100 + decimal) / number_of_persons / 100)
    |> D.cast()
    |> D.round(2)
    # Converting the decimal result to from decimal o float for a better result visualization
    |> D.to_float()
  end
end
