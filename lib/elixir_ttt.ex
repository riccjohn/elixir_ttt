board =
  Board.new()
  |> Board.take_turn(:x, 5)
  |> Board.take_turn(:o, 1)
  |> Board.take_turn(:x, 2)
  |> Board.take_turn(:o, 4)
  |> Board.take_turn(:x, 9)

board_string = UI.format_board(board)
IO.puts(board_string)
