defmodule FizzBuzz do
  def run(file_name) do
    # file = File.read(file_name)

    # {:ok, file} = File.read(file_name)

    # case File.read(file_name) do
    #   {:ok, content} -> content
    #   {:error, reason} -> reason
    # end

    file_name
    |> File.read()
    |> handle_file_read
  end

  # defp -> private functions
  defp handle_file_read({:ok, content}) do
    content =
      content
      |> String.split(",")
      # Enum.map(list, fn number -> String.to_integer(number) end)
      |> Enum.map(&convert_and_evaluate/1)

    {:ok, content}
  end

  # when a keyword list is passed as lat element in a tuple, it don't need square brackets
  defp handle_file_read({:error, reason}), do: {:error, reason: "Error on read file: #{reason}"}

  defp convert_and_evaluate(number) do
    number
    |> String.to_integer()
    |> evaluate_number
  end

  # using guard
  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
