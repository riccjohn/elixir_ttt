defmodule WinDetection do
  # def detect_win(game_state) do
  #   if detect_row_win(game_state.board) do
  #     %{game_state | :status => {:end, "Player #{player} wins!"}}
  #   end
  # end

  def detect_row_win(board) do
    {top_row, _} = Map.split(board, [0, 1, 2])
    {middle_row, _} = Map.split(board, [3, 4, 5])
    {bottom_row, _} = Map.split(board, [6, 7, 8])

    top = count_unique_values(top_row)
    middle = count_unique_values(middle_row)
    bottom = count_unique_values(bottom_row)

    if Enum.any?([top, middle, bottom], fn x -> x == 1 end) do
      true
    else
      false
    end
  end

  def count_unique_values(map) do
    map |> Map.values |> Enum.uniq |> length
  end
end