defmodule Advent2021.Day3 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
  end

  def part1(input) do
    epsilon =
      input
      |> parse
      |> Enum.reduce(nil, fn line, acc ->
        result_of_line =
          String.graphemes(line)
          |> Enum.map(fn char ->
            if char == "0" do
              {1, 0}
            else
              {0, 1}
            end
          end)

        if acc == nil do
          result_of_line
        else
          Enum.zip(result_of_line, acc)
          |> Enum.map(fn {r, a} ->
            {r0, r1} = r
            {a0, a1} = a
            {r0 + a0, r1 + a1}
          end)
        end
      end)
      |> Enum.map(fn {zeros, ones} ->
        if zeros > ones do
          "0"
        else
          "1"
        end
      end)

    {gamma, _} =
      epsilon
      |> Enum.map(fn value ->
        if value == "1" do
          "0"
        else
          "1"
        end
      end)
      |> Enum.join()
      |> Integer.parse(2)

    {epsilon, _} =
      epsilon
      |> Enum.join()
      |> Integer.parse(2)

    epsilon * gamma
  end

  def part2(input) do
    input
    |> parse
  end
end
