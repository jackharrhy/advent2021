defmodule Advent2021.Day1 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    input
    |> parse
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [x, y] -> y - x end)
    |> Enum.count(fn x -> x > 0 end)
  end

  def part2(input) do
    input
    |> parse
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(fn list -> Enum.sum(list) end)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [x, y] -> y - x end)
    |> Enum.count(fn x -> x > 0 end)
  end
end
