defmodule FriendsTest do
  use ExUnit.Case
  doctest Friends

  test "greets the world" do
    assert Friends.hello() == :world
  end
end
