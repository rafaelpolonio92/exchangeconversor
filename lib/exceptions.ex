# defmodule Money.UnknownCurrencyError do
#   defexception [:message]

#   def exception(message) do
#     %__MODULE__{message: message}
#   end
# end

# defmodule Money.ExchangeRateError do
#   defexception [:message]

#   def exception(message) do
#     %__MODULE__{message: message}
#   end
# end

# defmodule Money.InvalidAmountError do
#   defexception [:message]

#   def exception(message) do
#     %__MODULE__{message: message}
#   end
# end

# defmodule Money.Invalid do
#   defexception [:message]

#   def exception(message) do
#     %__MODULE__{message: message}
#   end
# end

defmodule CurrencyExceptions do
  def currency_not_found(to) do
    {:error,
        {Currency.Error,
        "Can't convert to #{to}. " <>
          "Currency not found"}}
  end

  def check_from_brl(from) do
    {:error,
        {Currency.Error,
        "This version only supports conversion from BRL"}}
  end
end
