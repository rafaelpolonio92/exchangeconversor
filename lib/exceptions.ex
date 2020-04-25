defmodule CurrencyExceptions do
  @moduledoc """
    This module contains possible currency exceptions
  """
  def currency_not_found(to) do
    {:error,
     {Currency.Error,
      "Can't convert to #{to}. " <>
        "Currency not found"}}
  end
end
