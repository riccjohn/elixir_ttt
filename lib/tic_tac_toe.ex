defmodule TicTacToe do
  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Console.Board, as: Board
  alias TicTacToe.Console.Input, as: Input
  alias TicTacToe.Console.Output, as: Output

  def main(_) do
    game = Game.new()
    loop(game)
  end

  def loop(game) do
    print_formatted(game.board)
    move = Input.get_square_for_turn(game.next_player)
    updated_game = play_next_round(game, move)

    if game.status != {:ok} do
      Output.print("GAME OVER")
    else
      loop(updated_game)
    end
  end

  def play_next_round(game, square_index) do
    Game.take_turn(game, square_index)
  end

  defp print_formatted(board) do
    Board.format(board)
    |> Output.print()
  end
end
