defmodule Omega.WaitingRoomTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, room} = start_supervised Omega.WaitingRoom
    %{room: room}
  end

  test "user in waiting room is in waiting state" do
    {:ok, user} = start_supervised Omega.User
    :ok = Omega.WaitingRoom.join(room, user)
    assert Omega.User.get_room(user) == :waiting
  end

  test "rooms are created" do
    range = 1..Application.fetch_env!(:omega, :max_users_per_room)
    users = Enum.map(range, fn(_) -> 
      {:ok, user} = start_supervised Omega.User
      :ok = Omega.WaitingRoom.join(room, user)
      user
    end)
    rooms = Enum.map(users, fn(user) ->
      Omega.User.get_room(user)
    end)
    assert Set.size(Enum.uniq(rooms)) == 1
  end
end