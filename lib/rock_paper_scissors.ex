defmodule RockPaperScissors do
  @moduledoc """
  Documentation for `RockPaperScissors`.
  """

  @doc """
  Use RockpaperScissors.init to start
  """
  def init(score \\ %{round: 0, user: 0, bot: 0}) do
    IO.write("The score are :\n -Human: #{score[:user]}\n -Bot: #{score[:bot]}\n\n")
    user_choice = IO.gets("Chose your answer : \n 1>Rock \n 2>Paper \n 3>Scissors \n>")
    |> String.trim("\n")
    |> String.to_integer()

    verif_win(score)
    cond do
      Enum.member?([1, 2, 3], user_choice) ->
        play(user_choice, bot(), score)

      true ->
        RockPaperScissors.init(score)
    end
  end


  def play(user_choice, bot_choice, score) when user_choice === bot_choice do
    score = Map.update!(score, :round, &(&1 + 1))
    verif_win(score)
    RockPaperScissors.init(score)

    {:ok, :nobody}
  end

  def play(1 = _user_choice, 3 = _bot_choice, score) do
    score = Map.update!(score, :user, &(&1 + 1))
    verif_win(score)
    RockPaperScissors.init(score)
    {:ok, :user}
  end

  def play(2 = _user_choice, 1 = _bot_choice, score) do
    score = Map.update!(score, :user, &(&1 + 1))
    verif_win(score)
    RockPaperScissors.init(score)
    {:ok, :user}
  end

  def play(3 = _user_choice, 2 = _bot_choice, score) do
    score = Map.update!(score, :user, &(&1 + 1))
    verif_win(score)
    RockPaperScissors.init(score)
    {:ok, :user}
  end

  def play(_user_choice, _bot_choice, score) do
    score = Map.update!(score, :bot, &(&1 + 1))
    verif_win(score)
    RockPaperScissors.init(score)
    {:ok, :bot}
  end

  defp bot, do: Enum.random([1, 2, 3])

  defp verif_win(score) do
    cond do
      score[:user] >= 3 ->
        IO.puts("\n-----\nCongrats ! You Win ! \n-----\n")
        exit("User win")

      score[:bot] >= 3 ->
        IO.puts("\n-----\nWhoops, the bot win....\n-----\n")
        exit("The bot win.")

      true ->
        :ok
    end
  end

end
