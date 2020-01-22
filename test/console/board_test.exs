defmodule TicTacToe.Console.BoardTest do
  use ExUnit.Case

  alias TicTacToe.Console.Board, as: ConsoleBoard
  alias TicTacToe.Core.Board, as: Board

  @moduletag :TicTacToeConsoleBoard

  describe "format" do
    @describetag TicTacToeConsoleBoard: "format"

    test "will draw an empty board given a newly created board map" do
      board_data = Board.new()

      board_string = ConsoleBoard.format(board_data)
      assert "1 2 3 \n4 5 6 \n7 8 9 " == board_string
    end

    test "draws a board with one move" do
      board =
        Board.new()
        |> Board.place_marker(:x, 5)

      board_string = ConsoleBoard.format(board)
      assert "1 2 3 \n4 X 6 \n7 8 9 " == board_string
    end

    test "will draw an in-progress board" do
      board =
        Board.new()
        |> Board.place_marker(:x, 5)
        |> Board.place_marker(:o, 1)
        |> Board.place_marker(:x, 2)
        |> Board.place_marker(:o, 4)
        |> Board.place_marker(:x, 9)

      board_string = ConsoleBoard.format(board)
      assert "O X 3 \nO X 6 \n7 8 X " == board_string
    end
  end
end
