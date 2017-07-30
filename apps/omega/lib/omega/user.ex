defmodule Omega.User do
  use Agent

  @moduledoc """
  Documentation for the User module.
  """

  @doc """
  Creates a user given a name.
  """
  def start_link(_opts) do
    name = Haikunator.build(4, ".")
    state = %{name: name}
    Agent.start_link(fn -> state end)
  end

  @doc """
  Gets the name of a given user.
  """
  def get_name(user) do
    Agent.get(user, &Map.get(&1, :name))
  end

end
