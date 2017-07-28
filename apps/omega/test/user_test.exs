defmodule Omega.UserTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, user} = start_supervised Omega.User
    %{user: user}
  end

  test "name is retrievable", %{user: user} do
    assert Omega.User.get_name(user) == "Null"
  end
end