defmodule RockPaperScissors do
  @moduledoc """
  Documentation for `RockPaperScissors`.
  """

  @doc """

  """
  def init do
    IO.write("Hello, welcome in the Rock Paper Scissors Game !\n")
    user_choice = IO.gets("Chose your answer : \n 1>Rock \n 2>Paper \n 3>Scissors \n")
    |> String.trim("\n")
    |> String.to_integer()


    if Enum.member?([1, 2, 3], user_choice) do
      play(user_choice, bot())
    else
      RockPaperScissors.init()
    end
  end


  def play(user_choice, bot_choice) when user_choice === bot_choice do
    {:ok, :nobody}
  end

  def play(1 = _user_choice, 3 = _bot_choice) do
    {:ok, :user}
  end

  def play(2 = _user_choice, 1 = _bot_choice) do
    {:ok, :user}
  end

  def play(3 = _user_choice, 2 = _bot_choice) do
    {:ok, :user}
  end

  def play(_user_choice, _bot_choice) do
    {:ok, :bot}
  end

  defp bot, do: Enum.random([1, 2, 3])

end
