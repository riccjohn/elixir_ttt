defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias TicTacToe.Core.Game, as: Game
  @moduletag :TicTacToe

  describe "start" do
    @describetag TicTacToe: "start"

    test "creates a new game" do
      capture_io(fn ->
        new_game = TicTacToe.start

        assert new_game.board
        assert new_game.next_player
        assert new_game.status
      end)
    end
  end
end