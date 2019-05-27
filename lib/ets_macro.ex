defmodule EtsMacro do
  @moduledoc """
  generates ets module under the name of your choice
  """

  @doc """
  use EtsMacro, module_name
  this will generate a module with all ets functions
  """
  defmacro __using__(module_name) do
    quote do
      defmodule unquote(module_name) do
        unquote(for {atom, fn_args} <- params(module_name) do
          case length(fn_args) do
            0 ->
              quote do
                def unquote(atom)() do
                  :ets.unquote(atom)()
                end
              end
            1 ->
              quote do
                def unquote(atom)() do
                  :ets.unquote(atom)(unquote(module_name))
                end
              end
            _ ->
              quote do
                def unquote(atom)(unquote_splicing(fn_args)) do
                  :ets.unquote(atom)(unquote(module_name), unquote_splicing(fn_args))
                end
              end
          end
        end)
      end
    end
  end

  @doc """
  same as the `use EtsMacro, module_name` but you can call it with EtsMacro.main()
  """
  defmacro main(module_name) do
    quote do
      defmodule unquote(module_name) do
        unquote(for {atom, fn_args} <- params(module_name) do
          case length(fn_args) do
            0 ->
              quote do
                def unquote(atom)() do
                  :ets.unquote(atom)()
                end
              end
            1 ->
              quote do
                def unquote(atom)(unquote_splicing(fn_args)) do
                  :ets.unquote(atom)(unquote(module_name))
                end
              end
            _ ->
              quote do
                def unquote(atom)(unquote_splicing(fn_args)) do
                  :ets.unquote(atom)(unquote(module_name), unquote(fn_args))
                end
              end
          end
        end)
      end
    end
  end

  defp params(module_name) do
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
      atom = String.to_atom(name)
      fn_args =
        case num do
          0 -> []
          1 -> [module_name]
          _ -> [
            module_name |
            for i <- 2..num do
              [:a, :b, :c, :d, :e, :f]
              |> Enum.at(i)
            end
          ]
        end

      {atom, fn_args}
    end
  end
end
