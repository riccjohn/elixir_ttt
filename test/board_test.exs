defmodule BoardTest do
  use ExUnit.Case

  test "new_game creates data with a player and a board" do
    game = Board.new_game

    assert game.next_player
    assert game.board
  end

  test "new_game creates a board containing 9 elements" do
    game = Board.new_game
    board = game.board

    assert (map_size board) == 9
  end

  test "new_game creates a board with tuples as keys" do
    game = Board.new_game
    board = game.board
    keys = Map.keys(board)

    assert Enum.all?(keys, fn key -> is_tuple key end)
  end

  test "new_game creates a board with each square set as nil" do
    game = Board.new_game
    board = game.board 

    values = Map.values(board)
    assert Enum.all?(values, fn value -> value == nil end)
  end
end