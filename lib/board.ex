defmodule Board do
  def new do
    %{
      :x => [],
      :o => []
    }
  end

  def take_turn(board, player, square_index) do
    occupied_squares = Map.get(board, :x) ++ Map.get(board, :o)

    if Enum.member?(occupied_squares, square_index) do
      {:error, :space_occupied}
    else
      %{board | player => board[player] ++ [square_index]}
    end
  end
end
