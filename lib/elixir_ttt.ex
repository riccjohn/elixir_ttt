board =
  TicTacToe.Core.Board.new()
  |> TicTacToe.Core.Board.place_marker(:x, 5)
  |> TicTacToe.Core.Board.place_marker(:o, 1)
  |> TicTacToe.Core.Board.place_marker(:x, 2)
  |> TicTacToe.Core.Board.place_marker(:o, 4)
  |> TicTacToe.Core.Board.place_marker(:x, 9)

board_string = TicTacToe.Console.Board.format(board)
IO.puts(board_string)
