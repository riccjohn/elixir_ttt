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

    assert values == Enum.to_list 0..8 
  end
end