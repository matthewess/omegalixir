defmodule Omega.WaitingRoomTest do
  use ExUnit.Case, async: true

  test "user in waiting room is in waiting state" do
    {:ok, user} = start_supervised Omega.User
    :ok = Omega.WaitingRoom.join(user)
    assert Omega.User.get_room(user) == :waiting
  end

  test "rooms are created" do
    range = 1..Application.fetch_env!(:omega, :max_users_per_room)
    users = Enum.map(range, fn(i) ->
      {:ok, user} = start_supervised Omega.User, id: "user" <> Integer.to_string(i)
      :ok = Omega.WaitingRoom.join(user)
      user
    end)
    rooms = Enum.map(users, fn(user) ->
      Omega.User.get_room(user)
    end)
    assert Enum.count(Enum.uniq(rooms)) == 1
  end
end
