defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board

  def start do
    game = Game.new
    Board.print(game.board)
    game
  end
end