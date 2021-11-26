defmodule Advent2021.Day0 do
  alias Advent2021.Utils

  @goal 2020

  def invoke(input) do
    [[x, y]] =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Utils.permutations(2)
      |> Enum.filter(fn [x, y] ->
        x + y == @goal
      end)
      |> Enum.take(1)

    x * y
  end
end
