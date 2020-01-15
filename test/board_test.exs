defmodule BoardTest do
  use ExUnit.Case
  @moduletag :board

  describe "new" do
    @describetag board: "new"

    test "creates a new board with keys for each player" do
      board = Board.new()
      assert [] == board.x
      assert [] == board.o
    end
  end

  describe "take_turn" do
    @describetag board: "take_turn"

    test "records a player's move on the board" do
      board = Board.new()
      after_x_move = Board.take_turn(board, :x, 5)

      assert Enum.member?(after_x_move.x, 5)
    end

    test "can handle multiple players" do
      board = Board.new()
      turn_1 = Board.take_turn(board, :x, 5)
      turn_2 = Board.take_turn(turn_1, :o, 1)
      assert %{:x => [5], :o => [1]} == turn_2
    end

    test "can handle multiple turns per player" do
      board = Board.new()
      turn_1 = Board.take_turn(board, :x, 5)
      turn_2 = Board.take_turn(turn_1, :o, 1)
      turn_3 = Board.take_turn(turn_2, :x, 3)
      turn_4 = Board.take_turn(turn_3, :o, 7)
      assert %{:x => [5, 3], :o => [1, 7]} == turn_4
    end

    test "will not place a marker on an occupied square" do
      board = Board.new()
      after_first_move = Board.take_turn(board, :x, 5)

      after_second_move = Board.take_turn(after_first_move, :o, 5)

      assert {:error, :space_occupied} == after_second_move
    end
  end
end
