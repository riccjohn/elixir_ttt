defmodule TicTacToe.Console.Input do
  def get_square_for_turn(player) do
    current_player =
      Atom.to_string(player)
      |> String.capitalize()

    IO.gets("Player #{current_player}. Choose a square: ")
    |> String.trim("\n")
    |> String.to_integer()
  end
end
