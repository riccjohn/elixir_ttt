defmodule TicTacToe.Core.Game do
  alias TicTacToe.Core.Board, as: Board

  def new do
    %{
      :board => Board.new(),
      :next_player => :x,
      :status => {:ok}
    }
  end

  def take_turn(game, square_index) do
    current_player = game.next_player
    current_board = game.board

    new_board = Board.place_marker(current_board, current_player, square_index)
    next_player = switch_player(current_player)

    %{game | :next_player => next_player, :board => new_board}
  end

  defp switch_player(:x), do: :o
  defp switch_player(:o), do: :x
end
