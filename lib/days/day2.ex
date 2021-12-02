defmodule Advent2021.Day2 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x ->
      [direction, amount] = String.split(x, " ")
      {String.to_atom(direction), String.to_integer(amount)}
    end)
  end

  def move_part1({previous_horizontal, previous_depth}, :forward, amount) do
    {previous_horizontal + amount, previous_depth}
  end

  def move_part1({previous_horizontal, previous_depth}, :down, amount) do
    {previous_horizontal, previous_depth + amount}
  end

  def move_part1({previous_horizontal, previous_depth}, :up, amount) do
    {previous_horizontal, previous_depth - amount}
  end

  def move_part2({previous_horizontal, previous_depth, previous_aim}, :down, amount) do
    {previous_horizontal, previous_depth, previous_aim + amount}
  end

  def move_part2({previous_horizontal, previous_depth, previous_aim}, :up, amount) do
    {previous_horizontal, previous_depth, previous_aim - amount}
  end

  def move_part2({previous_horizontal, previous_depth, previous_aim}, :forward, amount) do
    {previous_horizontal + amount, previous_depth + previous_aim * amount, previous_aim}
  end

  def apply_dive(input, acc, callback) do
    list =
      input
      |> parse
      |> Enum.reduce(acc, fn {direction, amount}, previous ->
        callback.(previous, direction, amount)
      end)
      |> Tuple.to_list()

    {horizontal, _} = List.pop_at(list, 0)
    {depth, _} = List.pop_at(list, 1)

    horizontal * depth
  end

  def part1(input) do
    apply_dive(input, {0, 0}, &move_part1/3)
  end

  def part2(input) do
    apply_dive(input, {0, 0, 0}, &move_part2/3)
  end
end
