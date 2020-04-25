# Currency Converter

This is a simple currency converter and split-amount script built for Stone challenge

## Example

```elixir
  For this version, you can only convert from BRL to other currencies
  iex(1)> CurrencyController.currency_converter({ "brl", "EUR", "22.16" })
  3.72

  split values
  iex(1)> CurrencyController.split_value({ 3.18, 3 })
  1.06
```

Currencies Codes must be bitstrings, with both lowercase or uppercase
Amount must be numbers, but as float or inside a string
Results are calculated as Decimal (better accuracy) but are printed as Float for better visualization


## Installation

  1. Clone de Project

  2. Open command prompt in the project folder

  3. run mix deps.get

  4. run mix deps.compile

  5. run mix compile

  6. run iex -S mix to open the iex interactive

  7. run Example comands
