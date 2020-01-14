defmodule Board do
  def new_game do
    %{
      :next_player => :x,
      :board => %{
        {0, 0} => nil, {1, 0} =>  nil, {2, 0} => nil,
        {0, 1} => nil, {1, 1} =>  nil, {2, 1} => nil,
        {0, 2} => nil, {1, 2} =>  nil, {2, 2} => nil
      }
    }
  end

  def take_turn(game_state, coordinates) do
    current_board = game_state.board
    current_player = game_state.next_player

    new_board = %{ current_board | coordinates => current_player }
    new_player = switch_player current_player

    %{ game_state | :next_player => new_player, :board => new_board }
  end

  def switch_player(:x), do: :o
  def switch_player(:o), do: :x
end