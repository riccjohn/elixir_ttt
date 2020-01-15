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

    test "creates data with an initial status" do
      game = Board.new_game
      
      assert {:ok} == game.status
    end

    test "creates data with the next player set to X" do
      game = Board.new_game
      assert :x == game.next_player
    end

    test "creates a board containing 9 elements" do
      game = Board.new_game
      board = game.board

      assert 9 == (map_size board)
    end

    test "new_game creates a board with numbers as keys" do
      game = Board.new_game
      board = game.board
      keys = Map.keys(board)
  
      assert Enum.all?(keys, fn key -> is_number key end)
    end
  
    test "creates a board with numbers 0 - 8 as the values" do
      game = Board.new_game
      board = game.board
      values = Map.values(board)

      assert (Enum.to_list 0..8) == values
    end
  end

  describe "take_turn function" do
    @describetag board: "take_turn"

    test "returns a new game state with data added to the correct square" do
      game = Board.new_game

      updated_board = Board.take_turn(game, 4).board

      assert {:ok, :x} == Map.fetch(updated_board, 4)
    end

    test "switches player to O after placing X's move" do
      game = Board.new_game
      updated_game = Board.take_turn(game, 0)

      assert {:ok, :o} == Map.fetch(updated_game, :next_player)
    end

    test "switches player to X after placing O's move" do
      new_game = Board.new_game
      x_turn_state = Board.take_turn(new_game, 0)
      o_turn_state = Board.take_turn(x_turn_state, 4)
      
      assert {:ok, :x} == Map.fetch(o_turn_state, :next_player)
    end

    test "does not allow a move if square already occupied by player input" do
      new_game = Board.new_game
      x_turn_state = Board.take_turn(new_game, 0)
      o_turn_state = Board.take_turn(x_turn_state, 0)

      assert {:ok, :o} == Map.fetch(o_turn_state, :next_player)
      assert {:ok, :x} == Map.fetch(o_turn_state.board, 0)
    end
  end
end