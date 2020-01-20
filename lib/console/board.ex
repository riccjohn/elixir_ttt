defmodule TicTacToe.Console.Board do
  def format(board) do
    values = [1, 2, 3, "\n", 4, 5, 6, "\n", 7, 8, 9]

    Enum.map(values, fn value ->
      cond do
        value == "\n" ->
          "\n"

        true ->
          TicTacToe.Core.Board.player_at(board, value)
          |> convert_to_char(value)
      end
    end)
    |> Enum.join("")
  end

  def print(board) do
    board_string = format(board)
    IO.puts(board_string)
  end

  defp convert_to_char(:x, _) do
    "X "
  end

  defp convert_to_char(:o, _) do
    "O "
  end

  defp convert_to_char(_, value) do
    "#{value} "
  end
end
