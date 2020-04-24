defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ from, to, amount }) when is_binary(to) and is_binary(from) do
    exchangeResult = exchangeConversion({ from, to, amount })
    exchangeResult
  end

  def currencyConverter(_), do: raise "Invalid Input"

  def splitValue({ amount, numberOfPersons }) do
    { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
    splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
    splittedValue
  end
end

# {:error,
# {Money.InvalidAmountError,
#  "Input amount #{amount} " <>
#    "is invalid. Amount must be a Float Value"}}
