defmodule Omega.User do
  @moduledoc """
  Representation for a User.
  """
  use Agent

  # Public API
  
  @doc """
  Creates a user with a random name.
  """
  def start_link(_opts) do
    name = Omega.Name.generate
    {:ok, room} = Omega.RoomSupervisor.join(self)
    state = %{name: name, room: room}
    Agent.start_link(fn -> state end)
  end

  @doc """
  Gets the name of a given user.
  """
  def get_name(user) do
    Agent.get(user, &Map.get(&1, :name))
  end

end
