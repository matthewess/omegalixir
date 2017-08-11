defmodule Omega.WaitingRoomTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, room} = start_supervised Omega.WaitingRoom
    %{room: room}
  end
end