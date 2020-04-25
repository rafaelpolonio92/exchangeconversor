defmodule CurrencyController do
  import CurrencyConverter
  import Currencies
  import CurrencyExceptions

  @moduledoc """
    The controller handle with currency_converter functions and build de final result`.
    This version only supports conversion from BRL to other currencies
  """

  def currency_converter({from, to, amount}) when is_bitstring(to) and is_bitstring(from) do
    if check_currency(to) do
      exchange_result = exchange_conversion({from, to, amount})
      exchange_result
    else
      currency_not_found(to)
    end
  end

  def split_value({amount, number_of_persons}) when is_integer(number_of_persons) do
    {formatted_integer_amount, formatted_decimal_amount} = parsed_amount(amount)

    splitted_value =
      formatted_split_value(
        {formatted_integer_amount, formatted_decimal_amount, number_of_persons}
      )

    splitted_value
  end
end
