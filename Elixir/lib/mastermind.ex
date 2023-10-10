defmodule Mastermind do
  @moduledoc """
  Functions for playing the game Mastermind

  The idea of this Kata is to code an algorithm capable of playing this boring role: answering the number of well placed and misplaced colors.

  Therefore, your function should return, for a secret and a guessing combination:

  * the number of well placed colors
  * the number of correct but misplaced colors

  A combination can contain any number of pegs but you’d better give the same number for the secret and the guessing. You can use any number of colors.
  """

  @colours [:red, :blue, :green, :orange, :purple, :yellow]

  def generate_secret() do
    Enum.take_random(@colours, 4)
  end

  def check_guess(guess, secret) do
    result = check_exact_match(guess, secret)
    adjusted_secret = adjust_secret(result, secret)
    remove_nils(result ++ check_colour_match(adjusted_secret, guess))
  end

  defp check_exact_match([], []), do: []

  defp check_exact_match([guess_one | guess_tail], [secret_one | secret_tail]) do
    if guess_one == secret_one do
      List.flatten([:black | check_exact_match(guess_tail, secret_tail)])
    else
      List.flatten([nil | check_exact_match(guess_tail, secret_tail)])
    end
  end

  defp adjust_secret([r1, r2, r3, r4], [s1, s2, s3, s4]) do
    []
    |> check_adjusted_secret(r1, s1)
    |> check_adjusted_secret(r2, s2)
    |> check_adjusted_secret(r3, s3)
    |> check_adjusted_secret(r4, s4)
    |> List.flatten()
  end

  defp check_adjusted_secret(adjusted_secret, result_color, secret_color) do
    cond do
      result_color == :black -> adjusted_secret ++ [nil]
      true -> adjusted_secret ++ [secret_color]
    end
  end

  defp check_colour_match([s_1, s_2, s_3, s_4], [g_one, g_two, g_three, g_four]) do
    []
    |> check_colour([s_2, s_3, s_4], g_one)
    |> check_colour([s_1, s_3, s_4], g_two)
    |> check_colour([s_1, s_2, s_4], g_three)
    |> check_colour([s_1, s_2, s_3], g_four)
  end

  defp check_colour(result, list, colour) do
    cond do
      Enum.member?(list, colour) -> [:white | result]
      true -> result
    end
  end

  defp remove_nils(list) do
    Enum.filter(list, &(!is_nil(&1)))
  end
end
