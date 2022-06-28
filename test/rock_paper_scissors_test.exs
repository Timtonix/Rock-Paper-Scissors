defmodule RockPaperScissorsTest do
  use ExUnit.Case
  doctest RockPaperScissors


  test "when choose rock and bot choose paper" do
    assert RockPaperScissors.play(1, 2) == {:ok, :bot}
  end

  test "when choose rock and bot choose scissors" do
    assert RockPaperScissors.play(1, 3) == {:ok, :user}
  end
end
