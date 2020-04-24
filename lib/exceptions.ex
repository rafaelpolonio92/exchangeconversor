defmodule CurrencyExceptions do
  def currency_not_found(to) do
    {:error,
        {Currency.Error,
        "Can't convert to #{to}. " <>
          "Currency not found"}}
  end
end
