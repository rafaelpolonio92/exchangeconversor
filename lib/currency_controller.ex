defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ to, amount }) do
    if is_float(amount) do
      result = exchangeConversion({ to, amount })
      exchangeResult = resultParser(result)
      exchangeResult
    else
      {:error,
      {Money.InvalidAmountError,
       "Input amount #{amount} " <>
         "is invalid. Amount must be a Float Value"}}
    end
  end

  def splitValue({ amount, numberOfPersons }) do
    if is_float(amount) && is_integer(numberOfPersons) do
      { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
      splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
      splittedValue
    else
      IO.puts("Invalid amount or number of persons")
    end
  end
end
