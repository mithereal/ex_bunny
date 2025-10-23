defmodule BunnyApiTest do
  use ExUnit.Case
  doctest BunnyApi

  test "greets the world" do
    assert Bunny.Net.hello() == :world
  end
end
