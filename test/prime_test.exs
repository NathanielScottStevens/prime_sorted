defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "gets primes" do
    assert Prime.get_primes([-9, -2, 0, 2, 4]) == [0, 4, 4, 16, 81]
  end

  test "gets primes with uneven sides" do
    assert Prime.get_primes([-9, -2, 0, 2, 4, 5, 6, 6]) == [0, 4, 4, 16, 25, 36, 36, 81]
  end

  test "gets primes starting with positive" do
    assert Prime.get_primes([2, 4, 5, 6]) == [4, 16, 25, 36]
  end
end
