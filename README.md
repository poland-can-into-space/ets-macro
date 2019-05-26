# EtsMacro

You can define your ets module with one macro call.
example
```
use EtsMacro, @module_name
```

this will define following functions under the given module name.
```
all/0
delete/1
delete/2
delete_all_objects/1
delete_object/2
first/1
give_away/3
info/1
info/2
insert/2
insert_new/2
is_compiled_ms/1
last/1
lookup/2
lookup_element/3
match/1
match/2
match/3
match_object/1
match_object/2
match_object/3
match_spec_compile/1
match_spec_run_r/3
member/2
new/2
next/2
prev/2
rename/2
safe_fixtable/2
select/1
select/2
select/3
select_count/2
select_delete/2
select_replace/2
select_reverse/1
select_reverse/2
select_reverse/3
setopts/2
slot/2
take/2
update_counter/3
update_counter/4
update_element/3
whereis/1
```
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
