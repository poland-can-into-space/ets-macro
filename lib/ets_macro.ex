defmodule EtsMacro do
  @moduledoc """
  generates ets module under the name of your choice
  """

  @doc """
  use EtsMacro, module_name
  this will generate a module with all ets functions and module_name as a first argument for any function that takes arguments
  """
  defmacro __using__(module_name) do
    quote do
      defmodule unquote(module_name) do
        unquote(for {atom, fn_args} <- params() do
          case fn_args do
            0 ->
              quote do
                def unquote(atom)(), do: :ets.unquote(atom)()
              end
            1 ->
              quote do
                def unquote(atom)(), do: :ets.unquote(atom)(unquote(module_name))
              end
            num ->
              args = for i <- 0..num-2, do: dynamic_arg(Enum.at([:a, :b, :c], i));
              quote do
                def unquote(atom)(unquote_splicing(args)) do
                  :ets.unquote(atom)(unquote(module_name), unquote_splicing(args))
                end
              end
          end
        end)
      end
    end
  end

  defp dynamic_arg(arg_name) do
    {arg_name, [], Elixir}
  end

  defp params() do
    x =
      """
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
      """

    for elem <- String.split(x) do
      [name, args] = String.split(elem, "/")
      {num, _} = Integer.parse(args)
      atom = String.to_atom(name);

      {atom, num}
    end
  end
end
