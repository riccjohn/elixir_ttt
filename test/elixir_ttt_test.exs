defmodule ElixirTttTest do
  use ExUnit.Case
  doctest ElixirTtt

  test "greets the world" do
    assert ElixirTtt.hello() == :world
  end

  test "can greet a person" do
    assert ElixirTtt.hello_name("John") == "Hello, John!"
  end
end
