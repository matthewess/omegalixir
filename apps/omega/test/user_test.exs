defmodule Omega.UserTest do
  use ExUnit.Case, async: true
  alias Omega.User, as: User

  setup do
    {:ok, user} = start_supervised Omega.User
    %{user: user}
  end

  test "name is retrievable", %{user: user} do
    assert User.get_name(user) =~ ~r|\w+\.\w+\.\d+|
  end
end
