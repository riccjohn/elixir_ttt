defmodule WinDetectionTest do
  use ExUnit.Case
  @moduletag :win_detection

  describe "detect_row_win" do
    @describetag win_detection: "row"

    test "will detect a win if there are 3 x's in the top row" do
      x_win_state = %{
        :next_player => :x,
        :board => %{
          0 => :x, 1 => :x, 2 => :x,
          3 => 3, 4 =>  :o, 5 => :o,
          6 => 6, 7 =>  7, 8 => 8
        },
        :status => {:ok}
      }

      result = WinDetection.detect_row_win(x_win_state.board)

      assert :true == result
    end

    test "will detect a win if there are 3 o's in the top row" do
      o_win_state = %{
        :next_player => :x,
        :board => %{
          0 => :o, 1 => :o, 2 => :o,
          3 => 3, 4 =>  :x, 5 => :x,
          6 => 6, 7 =>  :x, 8 => 8
        },
        :status => {:ok}
      }

      result = WinDetection.detect_row_win(o_win_state.board)

      assert :true == result
    end
  end

  test "will detect a win if there are 3 x's in the middle row" do
    x_win_state = %{
      :next_player => :x,
      :board => %{
        0 => :o, 1 => 1, 2 => :o,
        3 => :x, 4 =>  :x, 5 => :x,
        6 => 6, 7 =>  7, 8 => 8
      },
      :status => {:ok}
    }

    result = WinDetection.detect_row_win(x_win_state.board)

    assert :true == result
  end

  test "will detect a win if there are 3 x's in the bottom row" do
    x_win_state = %{
      :next_player => :x,
      :board => %{
        0 => :o, 1 => 1, 2 => :o,
        3 => 3, 4 =>  4, 5 => 5,
        6 => :x, 7 => :x, 8 => :x
      },
      :status => {:ok}
    }

    result = WinDetection.detect_row_win(x_win_state.board)

    assert :true == result
  end

  describe "detect_column_win" do
    @describetag win_detection: "column"

    test "will detect a win if there are 3 x's in the left column" do
      x_win_state = %{
        :next_player => :x,
        :board => %{
          0 => :x, 1 => 1, 2 => :o,
          3 => :x, 4 =>  :o, 5 => 5,
          6 => :x, 7 => 7, 8 => 8
        },
        :status => {:ok}
      }

      result = WinDetection.detect_column_win(x_win_state.board)
      assert :true = result
    end

    test "will detect a win if there are 3 o's in the left column" do
      o_win_state = %{
        :next_player => :x,
        :board => %{
          0 => :o, 1 => 1, 2 => :x,
          3 => :o, 4 =>  :x, 5 => 5,
          6 => :o, 7 => 7, 8 => 8
        },
        :status => {:ok}
      }

      result = WinDetection.detect_column_win(o_win_state.board)
      assert :true = result
    end

    test "will detect a win if there are 3 x's in the middle column" do
      x_win_state = %{
        :next_player => :x,
        :board => %{
          0 => :o, 1 => :x, 2 => :o,
          3 => 3, 4 =>  :x, 5 => 5,
          6 => 6, 7 => :x, 8 => 8
        },
        :status => {:ok}
      }

      result = WinDetection.detect_column_win(x_win_state.board)
      assert :true = result
    end

    test "will detect a win if there are 3 x's in the right column" do
      x_win_state = %{
        :next_player => :x,
        :board => %{
          0 => 0, 1 => 1, 2 => :x,
          3 => 3, 4 =>  :o, 5 => :x,
          6 => :o, 7 => 7, 8 => :x
        },
        :status => {:ok}
      }

      result = WinDetection.detect_column_win(x_win_state.board)
      assert :true = result
    end
  end
end
