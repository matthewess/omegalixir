defmodule Omega.WaitingRoom do
  use GenServer

  defstruct [:users]

  @moduledoc """
  Representation for a waiting state room.
  """

  # Public API

  @doc """
  Start a room.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  # Server Callbacks

  defp init(args) do
    users = args
    state = %Omega.WaitingRoom{users: users}
    {:ok, state}
  end
end