defmodule CurrencyController do
  import CurrencyConverter
  import Currencies
  import CurrencyExceptions
  @moduledoc """
    The controller handle with CurrencyConverter functions and build de final result`.
    This version only supports conversion from BRL to other currencies
  """

  def currencyConverter({ from, to, amount }) when is_bitstring(to) and is_bitstring(from) do
    if check_currency(to) do
      exchangeResult = exchangeConversion({ from, to, amount })
      exchangeResult
    else
      currency_not_found(to)
    end
  end

  def splitValue({ amount, numberOfPersons }) when is_integer(numberOfPersons) do
    { formattedIntegerAmount, formattedDecimalAmount } = parsedAmount(amount)
    splittedValue = formattedSplitValue({ formattedIntegerAmount, formattedDecimalAmount, numberOfPersons})
    splittedValue
  end
end


