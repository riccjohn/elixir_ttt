board =
  Board.new()
  |> Board.place_marker(:x, 5)
  |> Board.place_marker(:o, 1)
  |> Board.place_marker(:x, 2)
  |> Board.place_marker(:o, 4)
  |> Board.place_marker(:x, 9)

board_string = UI.format_board(board)
IO.puts(board_string)
