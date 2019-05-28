# EtsMacro
## Overview
ETS is a useful in-memory storage that runs within ErlangVM. 
Although it is very useful, it is tedious to defining interfaces your table.
I wrote this macro so that it can do the tedious part for you.
In a nutshell, `EtsMacro` is an alias with extra steps.

## Interface
Following code will define a new ets table with the given table name, and define ets functions (explained later).
```
use EtsMacro, module_name
```
## Functions that it ganerates
You should remember the tutorial from Elixir School.
```
iex> :ets.insert_new(:user_lookup, {"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})
false
iex> :ets.insert_new(:user_lookup, {"3100", "", ["Elixir", "Ruby", "JavaScript"]})
true
```
And it gets very tedious when you try to define ets functions like that under the module for your ets, even with `import :ets`.
```
defmodule MyEts do
  import :ets
  def insert_new(parameter) do
  # In production, it is very common to give ets table a name same as the module it is defined at.
    insert_new(__MODULE__, parameter)
  end
end 
# MyEts.insert_new({"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})
```

EtsMacro will do this for you.
Example:
```
defmodule MyEts do
  use EtsMacro, __MODULE__
end 
# MyEts.insert_new({"doomspork", "Sean", ["Elixir", "Ruby", "Java"]})
# MyEts.new(table_options)
# MyEts.lookup(key)
```

## Functions that EtsMacro will define
As I mentioned above, `EtsMacro` is an alias with extra steps.
Following is a list of functions that ets exports, and you will be able to call a function with a same name (but with different arity. I will explain this later).
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
- for ets functions that take no arguments  
EtsMacro will define module_name.[func_name]/0.
And the outcome of the function is same as the :ets.[func_name].
- for ets functions that takes 1 argument
EtsMacro will define module_name.[func_name]/0.
Outcome will be as same as calling :ets.[func_name](module_name).
- for ets functions that takes more than 2 or 2 arguments
EtsMacro will define module_name.[func_name]/number_of_arguments - 1.
Outcome will be as same as calling :ets.[func_name](module_name, `other arguments`).
So, for example, :ets.new(module_name, [:set]) will produce the same outcome as module_name.[func_name]([:set]).


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

## Feedbacks  
I appreciate feedbacks.
I hope my document made enough sense.
