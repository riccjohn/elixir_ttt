defmodule ElixirTtt do
  @moduledoc """
  Documentation for ElixirTtt.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirTtt.hello()
      :world

  """
  def hello do
    :world
  end

  def hello_name(name) do
    "Hello, " <> name <> "!"
  end
end