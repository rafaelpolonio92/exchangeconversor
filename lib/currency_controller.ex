defmodule CurrencyController do
  import CurrencyConverter

  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
  """

  def currencyConverter({ from, to, amount }) do
    if is_float(amount) do
      result = exchangeConversion({ from, to, amount })
      exchangeResult = resultParser(result)
      exchangeResult
    else
      IO.puts("Invalid Amount")
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
