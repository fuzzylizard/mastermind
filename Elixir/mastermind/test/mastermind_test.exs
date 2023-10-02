defmodule MastermindTest do
  use ExUnit.Case
  doctest Mastermind

  @colours [:red, :blue, :green, :orange, :purple, :yellow]

  test "should return a new code" do
    result = Mastermind.generate_secret()
    [one, two, three, four] = result

    assert length(result) == 4
    assert Enum.member?(@colours, one) == true
    assert Enum.member?(@colours, two) == true
    assert Enum.member?(@colours, three) == true
    assert Enum.member?(@colours, four) == true
  end

  test "should return one black when one colour and location match" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :orange, :orange, :orange]

    assert Mastermind.check_guess(guess, secret) == [:black]
  end

  test "should return two blacks when two colours and locations match" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :orange, :green, :orange]

    assert Mastermind.check_guess(guess, secret) == [:black, :black]
  end

  test "should return three blacks when two colours and locations match" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :red, :green, :yellow]

    assert Mastermind.check_guess(guess, secret) == [:black, :black, :black]
  end

  test "should return four blacks when two colours and locations match" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :red, :green, :purple]

    assert Mastermind.check_guess(guess, secret) == [:black, :black, :black, :black]
  end

  test "should return empty array when nothing matches" do
    secret = [:blue, :red, :green, :purple]
    guess = [:orange, :orange, :orange, :orange]

    assert Mastermind.check_guess(guess, secret) == []
  end

  test "should return one white when one colour matches, but not location" do
    secret = [:blue, :red, :green, :purple]
    guess = [:green, :orange, :orange, :orange]

    assert Mastermind.check_guess(guess, secret) == [:white]
  end

  test "should return two whites when two colours match, but not locations" do
    secret = [:blue, :red, :green, :purple]
    guess = [:green, :green, :orange, :orange]

    assert Mastermind.check_guess(guess, secret) == [:white, :white]
  end

  test "should return three whites when three colours match, but not locations" do
    secret = [:blue, :red, :green, :purple]
    guess = [:green, :green, :red, :orange]

    assert Mastermind.check_guess(guess, secret) == [:white, :white, :white]
  end

  test "should return four whites when four colours match, but not locations" do
    secret = [:blue, :red, :green, :purple]
    guess = [:green, :green, :red, :blue]

    assert Mastermind.check_guess(guess, secret) == [:white, :white, :white, :white]
  end

  test "should return one black and one white" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :orange, :red, :orange]

    assert Mastermind.check_guess(guess, secret) == [:black, :white]
  end

  test "should return one black" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :orange, :blue, :orange]

    assert Mastermind.check_guess(guess, secret) == [:black]
  end

  test "should return two blacks and one white" do
    secret = [:blue, :red, :green, :purple]
    guess = [:blue, :orange, :green, :red]

    assert Mastermind.check_guess(guess, secret) == [:black, :black, :white]
  end
end
