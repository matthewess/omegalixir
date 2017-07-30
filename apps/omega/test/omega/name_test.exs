defmodule Omega.NameTest do
  use ExUnit.Case, async: true
  alias Omega.Name, as: Name

  test "names are different" do
    assert Name.generate != Name.generate
  end

  test "names are the right format" do
    assert Name.generate =~ ~r|\w+\.\w+\.\d{1,4}|
  end
end