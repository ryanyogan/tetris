defmodule Tetris.MixProject do
  use Mix.Project

  @app_name :tetris
  @version "0.0.3"
  @elixir_version "~> 1.9"

  def project do
    [
      app: @app_name,
      version: @version,
      elixir: @elixir_version,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
