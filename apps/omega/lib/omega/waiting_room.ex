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
  def join(user) do
    GenServer.cast(__MODULE__, {:join, user})
  end

  # Server Callbacks and private functions

  def init(:ok) do
    users = []
    {:ok, users}
  end

  def handle_cast({:join, user}, users) do
    users = [user | users]
    full =
      Enum.count(users) >= Application.fetch_env!(:omega, :max_users_per_room)
    users = if full do
      :ok = generate_room(users)
      []
    else
      users
    end
    {:no_reply, users}
  end

  defp generate_room(users) do
    {:ok, room} = Omega.RoomSupervisor.new_room(users)
    Enum.each(users, fn(user) ->
      Omega.User.start_chat(user, room)
    end)
    :ok
  end
end
