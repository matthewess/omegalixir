defmodule Omega.RoomSupervisor do
  @moduledoc """
  Manager for Rooms.
  """
  use Supervisor

  @name :room_supervisor

  # Public API

  @doc """
  Start the Room Supervisor.
  """
  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  # Server Callbacks

  @doc """
  Supervisor initialization callback.
  """
  def init(:ok) do
    Supervisor.init([Omega.Room], strategy: :simple_one_for_one)
  end

  # Private functions

  defp new_room(users) do
    Supervisor.start_child(@name, [users])
  end
end
