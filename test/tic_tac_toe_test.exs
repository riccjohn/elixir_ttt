defmodule TicTacToeTest do
  use ExUnit.Case

  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Core.Board, as: Board

  @moduletag :TicTacToeTest

  describe "play_next_round" do
    test "will apply a single move to a given game " do
      new_game = Game.new()

      result = TicTacToe.play_next_round(new_game, 5)
      assert :x == Board.player_at(result.board, 5)
    end

    test "will apply multiple moves to a given game" do
      new_game = Game.new()

      result = List.foldl([5, 1], new_game, fn index, game -> TicTacToe.play_next_round(game, index) end)
      assert :x == Board.player_at(result.board, 5)
      assert :o == Board.player_at(result.board, 1)
    end
  end
end
