defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ from, to, amount }) do
    exchangeResult = exchangeConversion({ from, to, amount })
    exchangeResult
  end

  def splitValue({ amount, numberOfPersons }) do
    { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
    splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
    splittedValue
  end
end
