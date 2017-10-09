defmodule OmegalixirWeb.PageController do
  use OmegalixirWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
