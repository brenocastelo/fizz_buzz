defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "run/1" do
    test "when a valid file is provided, return th FizzBuzz list" do
      assert FizzBuzz.run("numbers.txt") == {:ok, [1, 2, :fizz, :buzz, :fizz, :buzz, 13, :fizzbuzz, :buzz, 23]}
    end

    test "when file reading fails, return error" do
      assert FizzBuzz.run("invalid.txt") == {:error, [reason: "Error on read file: enoent"]}
    end
  end
end
