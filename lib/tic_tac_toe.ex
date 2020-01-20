defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board
  alias TicTacToe.Console.Input, as: Input
  alias TicTacToe.Console.Output, as: Output

  def main(_) do
    game = Game.new()

    print_formatted(game.board)
    play_next_round(game, game.status)
  end

  def play_next_round(game, status) when status != {:ok} do
    print_formatted(game.board)
  end

  def play_next_round(game, _status) do
    move = Input.get_square_for_turn(game.next_player)
    updated_game = Game.take_turn(game, move)

    print_formatted(updated_game.board)
    
    play_next_round(updated_game, updated_game.status)
  end

  defp print_formatted(board) do
    Board.format(board)
    |> Output.print()
  end
end
