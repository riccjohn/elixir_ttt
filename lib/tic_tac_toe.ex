defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board

  def main(_) do
    game = Game.new
    Board.print(game.board)
    move = Board.get_square_for_turn
    updated_game = Game.take_turn(game, move)
    Board.print(updated_game.board)
    updated_game
  end
end