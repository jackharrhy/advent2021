defmodule Advent2021.Utils do
  def permutations(list), do: permutations(list, length(list))

  def permutations(_, 0), do: [[]]
  def permutations(xs, 1), do: xs |> Enum.map(&[&1])

  def permutations(xs, k) do
    for x <- xs,
        y <- permutations(List.delete(xs, x), k - 1) do
      [x | y]
    end
  end
end
