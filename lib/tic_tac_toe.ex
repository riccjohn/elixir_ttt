defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board
  alias TicTacToe.Console.Input, as: Input
  alias TicTacToe.Console.Output, as: Output

  def main(_) do
    game = Game.new()

    print_formatted(game.board)

    move = Input.get_square_for_turn(game.next_player)
    updated_game = Game.take_turn(game, move)

    print_formatted(updated_game.board)

    updated_game
  end

  defp print_formatted(board) do
    Board.format(board)
    |> Output.print()
  end
end
