defmodule TalksWeb.PageController do
  use TalksWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
