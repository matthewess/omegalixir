defmodule Omega.RoomSupervisor do
  @moduledoc """
  Manager for Rooms.
  """
  use Supervisor

  @name :room_supervisor

  @doc """
  Start the Room Supervisor.
  """
  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  @doc """
  Puts a user into a waiting Room.
  """
  def join(user) do
    {:ok, full} = Omega.Room.enter(w_r, user)
    if full do
      w_r = new_room
    end
  end

  defp new_room do
    Supervisor.start_child(@name, [])
  end

  @doc """
  Supervisor initialization callback.
  """
  def init(:ok) do
    Supervisor.init([Omega.Room], strategy: :simple_one_for_one)
  end

end