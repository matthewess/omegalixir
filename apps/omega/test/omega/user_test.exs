defmodule Omega.UserTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, user} = start_supervised Omega.User
    %{user: user}
  end

  test "name is retrievable", %{user: user} do
    assert Omega.User.get_name(user) =~ ~r|\w+\.\w+\.\d{1,4}|
  end

  test "room is :waiting at start", %{user: user} do
    assert Omega.User.get_room(user) == :waiting
  end

  test "room is updated after chat is started", %{user: user} do
    :ok == Omega.User.start_chat(user, :dummy_room)
    assert Omega.User.get_room(user) == :dummy_room
  end

  test "room can't be set twice", %{user: user} do
    :ok == Omega.User.start_chat(user, :dummy_room)
    assert Omega.User.start_chat(user, :moron_room) == {:error, :already_in_room}
  end
end
