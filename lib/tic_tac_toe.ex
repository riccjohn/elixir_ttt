defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board
  alias TicTacToe.Console.Input, as: Input

  def main(_) do
    game = Game.new()
    Board.print_formatted(game.board)
    move = Input.get_square_for_turn(game.next_player)
    updated_game = Game.take_turn(game, move)
    Board.print_formatted(updated_game.board)
    updated_game
  end
end
