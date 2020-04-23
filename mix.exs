defmodule CurrecyConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :currecy_converter,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.8" },
      {:time_seer, "~> 0.0.6" },
      {:hackney, "~> 1.4"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:math, "~> 0.4.0"},
      {:decimal, "~> 1.0", override: true}
    ]
  end
end
