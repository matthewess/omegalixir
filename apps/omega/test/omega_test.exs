defmodule OmegaTest do
  use ExUnit.Case
  doctest Omega

  test "greets the world" do
    assert Omega.hello() == :world
  end
end
