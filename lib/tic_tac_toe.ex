defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board
  alias TicTacToe.Console.Input, as: Input
  alias TicTacToe.Console.Output, as: Output

  def main(_) do
    game = Game.new()

    formatted_new_board = Board.format(game.board)
    Output.print(formatted_new_board)

    move = Input.get_square_for_turn(game.next_player)
    updated_game = Game.take_turn(game, move)

    formatted_board = Board.format(updated_game.board)
    Output.print(formatted_board)

    updated_game
  end
end
