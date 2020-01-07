defmodule ElixirTttTest do
  use ExUnit.Case
  doctest ElixirTtt

  test "greets the world" do
    assert ElixirTtt.hello() == :world
  end
end
