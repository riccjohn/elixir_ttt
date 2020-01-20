defmodule TicTacToe.Core.Game do
  alias TicTacToe.Core.Board, as: Board
  alias TicTacToe.Console.Board, as: Console

  def new do
    new_game = %{
      :board => Board.new(),
      :next_player => :x,
      :status => {:ok}
    }

    Console.print(new_game.board)
    new_game
  end

  def take_turn(game, square_index) do
    current_player = game.next_player
    current_board = game.board

    new_board = Board.place_marker(current_board, current_player, square_index)
    next_player = switch_player(current_player)

    updated_game = %{game | :next_player => next_player, :board => new_board}
    Console.print(updated_game.board)
    updated_game
  end

  defp switch_player(:x), do: :o
  defp switch_player(:o), do: :x
end
