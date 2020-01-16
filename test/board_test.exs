defmodule BoardTest do
  use ExUnit.Case
  @moduletag :board

  describe "take_turn" do
    @describetag board: "take_turn"

    test "records a player's move on the board" do
      board =
        Board.new()
        |> Board.take_turn(:x, 5)

      assert Board.player_at(board, 5) == :x
    end

    test "can handle multiple players" do
      board =
        Board.new()
        |> Board.take_turn(:x, 5)
        |> Board.take_turn(:o, 1)

      assert :x == Board.player_at(board, 5)
      assert :o == Board.player_at(board, 1)
    end

    test "returns an empty spot" do
      board = Board.new()

      assert nil == Board.player_at(board, 5)
    end

    test "can handle multiple turns per player" do
      board =
        Board.new()
        |> Board.take_turn(:x, 5)
        |> Board.take_turn(:o, 1)
        |> Board.take_turn(:x, 3)
        |> Board.take_turn(:o, 7)

      assert :x == Board.player_at(board, 5)
      assert :x == Board.player_at(board, 3)
      assert :o == Board.player_at(board, 1)
      assert :o == Board.player_at(board, 7)
    end

    test "will overwrite an occupied square" do
      board =
        Board.new()
        |> Board.take_turn(:x, 5)
        |> Board.take_turn(:o, 5)

      assert :o == Board.player_at(board, 5)
    end
  end
end
