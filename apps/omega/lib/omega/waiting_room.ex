defmodule Omega.WaitingRoom do
  @moduledoc """
  Waiting Room to hold Users until there are enough for a full Room.
  """
  use GenServer

  # Public API

  @doc """
  Starts the Waiting Room.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Joins a user into the current waiting Room.
  """
  def join(waiting_room, user) do
    GenServer.cast(waiting_room, {:join, user})
  end

  # Server Callbacks and private functions

  defp init(:ok) do
    users = []
    {:ok, users}
  end

  defp handle_cast({:join, user}, users) do
    users = [user | users]
    full = Set.size(users) >= Application.fetch_env!(:omega, :max_users_per_room)
    if full do
      :ok = generate_room(users)
      users = []
    end
    {:no_reply, users}
  end

  defp generate_room(users) do
    {:ok, room} = Omega.RoomSupervisor.new_room(users)
    Enum.map(users, fn(user) ->
      User.start_chat(user, room)
    end)
    :ok
  end
end
