defmodule TicTacToe.Console.OutputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias TicTacToe.Console.Output, as: Output

  @moduletag :TicTacToeConsoleOutput

  describe "print" do
    @describetag TicTacToeConsoleOutput: "print"

    test "prints a given string to the console" do
      output =
        capture_io(fn ->
          Output.print("foo")
        end)

      assert "foo\n" == output
    end
  end
end
