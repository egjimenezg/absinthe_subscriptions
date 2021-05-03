defmodule AbsintheSubscriptionsWeb.PageController do
  use AbsintheSubscriptionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
