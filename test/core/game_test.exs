defmodule TicTacToe.Core.GameTest do
  use ExUnit.Case

  alias TicTacToe.Core.Game, as: Game
  alias TicTacToe.Core.Board, as: Board
  @moduletag :TicTacToeCoreGame

  describe "new" do
    @describetag TicTacToeCoreGame: "new"

    test "creates a new game structure with a board, player, and status" do
      game = Game.new()

      assert game.board
      assert game.next_player
      assert game.status
    end
  end

  describe "take_turn" do
    @describetag TicTacToeCoreGame: "take_turn"

    test "places a marker at the correct square" do
        game =
          Game.new()
          |> Game.take_turn(5)

        assert :x == Board.player_at(game.board, 5)
    end

    test "switches game to next player" do
      game =
        Game.new()
        |> Game.take_turn(5)

      assert :o == game.next_player
    end
  end
end
