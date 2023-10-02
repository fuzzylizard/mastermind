defmodule MastermindTest do
  use ExUnit.Case
  doctest Mastermind

  test "should return a new code" do
    assert Mastermind.generate_code() == [:blue, :blue, :yellow, :red]
  end

  test "should return an error when given an empty guess" do
    assert Mastermind.guess([]) == :error
  end

  test "given a perfect guess, should return four blacks" do
    guess = [:blue, :blue, :blue, :blue]
    code = [:blue, :blue, :blue, :blue]

    assert Mastermind.guess(%{guess: guess, code: code}) ==
             [:black, :black, :black, :black]
  end
end
