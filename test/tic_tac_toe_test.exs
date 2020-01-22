defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @moduletag :TicTacToeTest

  describe "play_next_round" do
    @describetag TicTacToe: "play_next_round"

    test "will print the board if the status is not :ok" do
      output =
        capture_io(fn ->
          game = TicTacToe.Core.Game.new()
          TicTacToe.play_next_round(game, {:end, :x_win})
        end)

      assert "1 2 3 \n4 5 6 \n7 8 9 \n" == output
    end
  end
end
