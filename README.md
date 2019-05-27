# EtsMacro

You can define your ets module with one macro call.

example
```
use EtsMacro, MyEts
```
this will generate a module with all ets functions and module_name as a first argument for any function that takes arguments.
So, you will be able to do it like this.
```
MyEts.new([:set, :protected, :named_table]) # is equivalent of :ets.new(MyEts, [:set, :protected, :named_table])
# MyEts.all() == :ets.new
# MyEts.lookup() == :ets.lookup(MyEts)
```
less typing. clap clap

If you have any questions about ets, please refer to erlang's website's official document [here](http://erlang.org/doc/man/ets.html).



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ets_macro` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ets_macro, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ets_macro](https://hexdocs.pm/ets_macro).
