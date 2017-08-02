defmodule Omega.Room do
  @moduledoc """
  Representation for an active room.
  """
  use GenServer

  # Public API

  @doc """
  Enter a User into a Room.
  """
  def enter(room, user) do
    GenServer.call(room, {:enter, user})
  end

  # Server Callbacks

  defp handle_call({:enter, user}, _from, users) do
    users = [user | users]
    num_users = users |> length
    full = num_users >= Application.fetch_env!(:omega, :max_users_per_room)
    {:reply, {:ok, full}, users}
  end
end
