defmodule Omega.Room do
  @moduledoc """
  Representation for an active Room.
  """
  use GenServer

  # Public API

  @doc """
  Start a new Room for a set of Users.
  """
  def start_link(opts) do
    users = List.last(opts)
    opts = Enum.drop(opts, -1)
    GenServer.start_link(__MODULE__, {:ok, users}, opts)
  end

  @doc """
  Returns a list of the Users in the Room. 
  Setting all to true will include the caller, who will be excluded otherwise.
  """
  def get_users(room, all \\ false) do
    GenServer.call(room, {:get_users, all})
  end

  # Server Callbacks and private functions

  defp init({:ok, users}) do
    names = users |> Enum.map(&User.get_name(&1))
    state =
      users
      |> Enum.zip(names)
      |> Enum.into(%{})
    {:ok, state}
  end

  defp handle_call({:get_users, all}, from, state) do
    if all do
      {:reply, state, state}
    else
      {:reply, Map.drop(state, from), state}
    end
  end
end
