defmodule TicTacToe.Console.InputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias TicTacToe.Console.Input, as: Input

  @moduletag :TicTacToeConsoleInput

  describe "get_square_for_turn" do
    @describetag TicTacToeConsoleInputt: "get_square_for_turn"

    test "presents player X with a prompt" do
      player = :x

      string_player =
        Atom.to_string(player)
        |> String.capitalize()

      expected = "Player #{string_player}. Choose a square: "

      assert expected ==
               capture_io(:stdio, [input: "5", capture_prompt: true], fn ->
                 Input.get_square_for_turn(player)
               end)
    end

    test "presents player O with a prompt" do
      player = :o

      string_player =
        Atom.to_string(player)
        |> String.capitalize()

      expected = "Player #{string_player}. Choose a square: "

      assert expected ==
               capture_io(:stdio, [input: "5", capture_prompt: true], fn ->
                 Input.get_square_for_turn(player)
               end)
    end

    test "returns the input value as an integer" do
      capture_io(:stdio, [input: "5", capture_prompt: true], fn ->
        value = Input.get_square_for_turn(:x)
        assert 5 == value
      end)
    end
  end
end
