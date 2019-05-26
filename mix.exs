defmodule EtsMacro.MixProject do
  use Mix.Project

  def project do
    [
      app: :ets_macro,
      version: "1.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "You can define your ets module with one macro call.",
      package: package(),
      deps: deps(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      name: :ets_macro,
      source_url: "https://github.com/poland-can-into-space/ets-macro",
      licenses: ["MIT"],
      maintainers: ["Thomas Cameron"],
      links: %{"GitHub" => "https://github.com/poland-can-into-space/ets-macro"}
    ]
  end
end
