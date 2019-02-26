defmodule Prime do
  def get_primes(nums) do
    center = Enum.reduce_while(nums, {0, nums |> hd |> abs},
      fn x, {index, last} ->
        if abs(x) > last, do: {:halt, index}, else: {:cont, {index + 1, abs(x)}}
      end)

    {left, right} = Enum.split(nums, center)

    get_primes(left, Enum.reverse(right), [])
  end

  def get_primes([l_h|l_t], [r_h|_] = right, acc) when abs(l_h) >= abs(r_h) do
    get_primes(l_t, right, [l_h * l_h|acc])
  end

  def get_primes(left, [r_h|r_t], acc) do
    get_primes(left, r_t, [r_h * r_h|acc])
  end

  def get_primes([], [r_h|r_t], acc) do
    get_primes([], r_t, [r_h * r_h|acc])
  end

  def get_primes([l_h|l_t], [], acc) do
    get_primes(l_t, [], [l_h * l_h|acc])
  end

  def get_primes([], [], acc) do
    acc
  end
end
