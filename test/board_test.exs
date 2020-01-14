defmodule BoardTest do
  use ExUnit.Case

  @moduletag :board

  describe "new_game function" do
    @describetag board: "new_game"

    test "creates data with a player and a board" do
      game = Board.new_game

      assert game.next_player
      assert game.board
    end

    test "creates data with the next player set to X" do
      game = Board.new_game
      assert game.next_player == :x
    end

    test "creates a board containing 9 elements" do
      game = Board.new_game
      board = game.board

      assert (map_size board) == 9
    end

    test "creates a board with tuples as keys" do
      game = Board.new_game
      board = game.board
      keys = Map.keys(board)

      assert Enum.all?(keys, fn key -> is_tuple key end)
    end

    test "creates a board with each square set as nil" do
      game = Board.new_game
      board = game.board 

      values = Map.values(board)
      assert Enum.all?(values, fn value -> value == nil end)
    end
  end

  describe "take_turn function" do
    @describetag board: "take_turn"

    test "returns a new game state with data added to the correct square" do
      game = Board.new_game

      updated_board = Board.take_turn(game, {1, 1}).board

      assert Map.fetch(updated_board, {1, 1}) == {:ok, :x}
    end

    test "switches player to O after placing X's move" do
      game = Board.new_game
      updated_game = Board.take_turn(game, {0, 0})

      assert Map.fetch(updated_game, :next_player) == {:ok, :o}
    end

    test "switches player to X after placing O's move" do
      new_game = Board.new_game
      x_turn_state = Board.take_turn(new_game, {0, 0})
      o_turn_state = Board.take_turn(x_turn_state, {1, 1})
      
      assert Map.fetch(o_turn_state, :next_player) == {:ok, :x}
    end
  end
end