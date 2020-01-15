defmodule UI do
  def format_board(board) do
    values = [1, 2, 3, "\n", 4, 5, 6, "\n", 7, 8, 9]

    x_spaces = board.x
    o_spaces = board.o

    with_input =
      Enum.map(values, fn value ->
        cond do
          Enum.member?(x_spaces, value) ->
            "X "

          Enum.member?(o_spaces, value) ->
            "O "

          value == "\n" ->
            value

          true ->
            "#{value} "
        end
      end)

    Enum.join(with_input, "")
  end
end
