defmodule Advent2021 do
  import Advent2021.Colorize

  @days %{
    "day0" => Advent2021.Day0
  }

  def cli do
    argv = System.argv()
    [day, filename] = argv

    day_module = Map.fetch!(@days, day)
    file_contents = File.read!(filename)

    IO.puts colorize(:light_blue, "Invoking #{day_module} with the contents of #{filename}:\n")

    output = day_module.invoke(file_contents)

    IO.puts colorize(:light_blue, "\nOutput:\n")

    IO.inspect output
  end
end

Advent2021.cli()
