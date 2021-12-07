defmodule SpaceexWeb.WelcomeController do
  use SpaceexWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> text("Back-end Challenge 2021 🏅 - Space Flight News")
  end
end
