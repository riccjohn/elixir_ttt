defmodule Board do
  def new_game do
    %{
      :next_player => :x,
      :board => %{
        0 => 0, 1 =>  1, 2 => 2,
        3 => 3, 4 =>  4, 5 => 5,
        6 => 6, 7 =>  7, 8 => 8
      }
    }
  end

  def take_turn(game_state, square_index) do
    current_board = game_state.board
    current_player = game_state.next_player

    new_board = %{ current_board | square_index => current_player }
    new_player = switch_player current_player

    %{ game_state | :next_player => new_player, :board => new_board }
  end

  def switch_player(:x), do: :o
  def switch_player(:o), do: :x
end