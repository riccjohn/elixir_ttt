defmodule Board do
  def new_game do
    %{
      :next_player => :o,
      :board => %{
        0 => 0, 1 =>  1, 2 => 2,
        3 => 3, 4 =>  4, 5 => 5,
        6 => 6, 7 =>  7, 8 => 8
      }
    }
  end
end