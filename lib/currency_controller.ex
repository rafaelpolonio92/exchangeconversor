defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ from, to, amount }) when is_bitstring(to) and is_bitstring(from) do
    exchangeResult = exchangeConversion({ from, to, amount })
    exchangeResult
  end

  def splitValue({ amount, numberOfPersons }) when is_integer(numberOfPersons) do
    { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
    splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
    splittedValue
  end
end

# {:error,
# {Money.InvalidAmountError,
#  "Input amount #{amount} " <>
#    "is invalid. Amount must be a Float Value"}}
