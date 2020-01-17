defmodule TicTacToe.Core.BoardTest do
  use ExUnit.Case
  @moduletag :TicTacToeCoreBoard

  describe "place_marker" do
    @describetag TicTacToeCoreBoard: "place_marker"

    test "records a player's move on the TicTacToe.Core.Board" do
      board =
        TicTacToe.Core.Board.new()
        |> TicTacToe.Core.Board.place_marker(:x, 5)

      assert TicTacToe.Core.Board.player_at(board, 5) == :x
    end

    test "can handle multiple players" do
      board =
        TicTacToe.Core.Board.new()
        |> TicTacToe.Core.Board.place_marker(:x, 5)
        |> TicTacToe.Core.Board.place_marker(:o, 1)

      assert :x == TicTacToe.Core.Board.player_at(board, 5)
      assert :o == TicTacToe.Core.Board.player_at(board, 1)
    end

    test "returns an empty spot" do
      board = TicTacToe.Core.Board.new()

      assert nil == TicTacToe.Core.Board.player_at(board, 5)
    end

    test "can handle multiple turns per player" do
      board =
        TicTacToe.Core.Board.new()
        |> TicTacToe.Core.Board.place_marker(:x, 5)
        |> TicTacToe.Core.Board.place_marker(:o, 1)
        |> TicTacToe.Core.Board.place_marker(:x, 3)
        |> TicTacToe.Core.Board.place_marker(:o, 7)

      assert :x == TicTacToe.Core.Board.player_at(board, 5)
      assert :x == TicTacToe.Core.Board.player_at(board, 3)
      assert :o == TicTacToe.Core.Board.player_at(board, 1)
      assert :o == TicTacToe.Core.Board.player_at(board, 7)
    end

    test "will overwrite an occupied square" do
      board =
        TicTacToe.Core.Board.new()
        |> TicTacToe.Core.Board.place_marker(:x, 5)
        |> TicTacToe.Core.Board.place_marker(:o, 5)

      assert :o == TicTacToe.Core.Board.player_at(board, 5)
    end
  end
end
