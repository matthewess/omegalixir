defmodule Omega.User do
  @moduledoc """
  Representation for a User.
  """
  use Agent

  # Public API

  @doc """
  Creates a User with a random name.
  """
  def start_link(_opts) do
    name = Omega.Name.generate
    :ok = Omega.WaitingRoom.join(self())
    state = %{name: name, room: nil}
    Agent.start_link(fn -> state end)
  end

  @doc """
  Gets the name of a given User.
  """
  def get_name(user) do
    Agent.get(user, &Map.get(&1, :name))
  end

  @doc """
  Starts a chat with the given User in the given Room.
  """
  def start_chat(user, room) do
    case get_room(user) do
      :waiting -> Agent.update(user, &Map.update!(&1, :room, fn -> room end))
      _ -> {:error, :already_in_room}
    end
  end

  @doc """
  Gets the name of the Room the given User is in, or :waiting if not in a room.
  """
  def get_room(user) do
    case Agent.get(user, &Map.get(&1, :room)) do
      nil -> :waiting
      room -> room
    end
  end
end
