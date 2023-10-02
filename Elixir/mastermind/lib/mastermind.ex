defmodule Mastermind do
  @moduledoc """
  Functions for playing the game Mastermind
  """

  def generate_code() do
    [:blue, :blue, :yellow, :red]
  end

  def guess([]), do: :error

  def guess(colours) do
    [:black, :black, :black, :black]
  end
end
