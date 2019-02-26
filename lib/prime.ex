defmodule Prime do
  def get_primes(nums) do
    first_num = nums |> hd |> abs

    index_of_first_positive = Enum.reduce_while(nums, {0, first_num},
      fn x, {index, last} ->
        if abs(x) > last, do: {:halt, index}, else: {:cont, {index + 1, abs(x)}}
      end)

    {negatives, positives} = Enum.split(nums, index_of_first_positive)
    get_primes(negatives, Enum.reverse(positives), [])
  end

  def get_primes([neg_h|neg_t], [pos_h|_] = pos, acc) when abs(neg_h) >= abs(pos_h) do
    get_primes(neg_t, pos, [neg_h * neg_h|acc])
  end

  def get_primes(neg, [h|t], acc) do
    get_primes(neg, t, [h * h|acc])
  end

  def get_primes([], [h|t], acc) do
    get_primes([], t, [h * h|acc])
  end

  def get_primes([h|t], [], acc) do
    get_primes(t, [], [h * h|acc])
  end

  def get_primes([], [], acc) do
    acc
  end
end
