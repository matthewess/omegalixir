defmodule Omega.NameTest do
  use ExUnit.Case, async: true

  test "names are different" do
    name1 = Omega.Name.generate()
    name2 = Omega.Name.generate()
    assert name1 != name2
  end

  test "names are the right format" do
    assert Omega.Name.generate =~ ~r|\w+\.\w+\.\d{1,4}|
  end
end
