defmodule Advent2021 do
  import Advent2021.Colorize

  @days %{
    "day1-part1" => {Advent2021.Day1, :part1},
    "day1-part2" => {Advent2021.Day1, :part2},
  }

  def cli do
    argv = System.argv()
    [day, filename] = argv

    {module, method}= Map.fetch!(@days, day)
    file_contents = File.read!(filename)

    IO.puts colorize(:light_blue, "Invoking #{module} with the contents of #{filename}:\n")

    output = apply(module, method, [file_contents])

    IO.puts colorize(:light_blue, "\nOutput:\n")

    IO.inspect output
  end
end

Advent2021.cli()
