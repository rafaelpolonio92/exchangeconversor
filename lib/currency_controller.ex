defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ from, to, amount }) when is_float(amount) do
    result = exchangeConversion({ from, to, amount })
    exchangeResult = resultParser(result)
    exchangeResult
  end

  def splitValue({ amount, numberOfPersons }) when is_float(amount) and is_integer(numberOfPersons) do
    { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
    splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
    splittedValue
  end
end
