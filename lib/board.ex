defmodule Board do
  def new_game do
    %{
      :next_player => :o,
      :board => %{
        {0, 0} => nil, {1, 0} =>  nil, {2, 0} => nil,
        {0, 1} => nil, {1, 1} =>  nil, {2, 1} => nil,
        {0, 2} => nil, {1, 2} =>  nil, {2, 2} => nil
      }
    }
  end
end