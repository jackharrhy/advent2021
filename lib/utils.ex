defmodule Advent2021.Utils do
  def permutations(list), do: permutations(list, length(list))

  def permutations(_, 0), do: [[]]
  def permutations(list, 1), do: list |> Enum.map(&[&1])

  def permutations(list, k) do
    for x <- list,
        y <- permutations(List.delete(list, x), k - 1) do
      [x | y]
    end
  end

  def comb(0, _), do: [[]]
  def comb(_, []), do: []

  def comb(m, [h | t]) do
    for(l <- comb(m - 1, t), do: [h | l]) ++ comb(m, t)
  end
end
