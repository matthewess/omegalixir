defmodule Omega.User do
  use Agent

  @moduledoc """
  Representation for a User.
  """

  @doc """
  Creates a user with a random name.
  """
  def start_link(_opts) do
    name = Omega.Name.generate
    {:ok, room} = self |> Omega.Room.join()
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
