defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    cond do
      conn.assigns.user ->
        conn
      true ->
        conn
        |> put_flash(:error, "You have to be signed in.")
        |> redirect(to: Helpers.topic_path(conn, :index))
        |> halt
    end
  end
end
