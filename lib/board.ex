defmodule Board do
  def new do
    %{}
  end

  def take_turn(board, player, square_index) do
    Map.put(board, square_index, player)
  end

  def player_at(board, square_index) do
    board[square_index]
  end
end
