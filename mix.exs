defmodule BunnyApi.MixProject do
  use Mix.Project

  @version "1.0.0"
  @source_url "https://github.com/mithereal/ex_bunny"

  defp package do
    # These are the default files included in the package
    [
      name: :bunny_net,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Jason Clark"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/mithereal/ex_bunny"}
    ]
  end

  def project do
    [
      app: :bunny_net,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "bunny_net",
      package: package(),
      description: description(),
      docs: docs(),
      aliases: aliases(),
      source_url: @source_url,
      test_coverage: [tool: ExCoveralls],
      preferred_cli: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.cobertura": :test
      ]
    ]
  end

  defp description do
    "Feature Complete Client For BUNNY.NET."
  end

  defp docs do
    [
      main: "Bunny.Net",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      c: "compile"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bunny_cdn_signer, "~> 0.1.2"},
      {:excoveralls, "~> 0.14", only: [:test, :dev]}
    ]
  end
end
