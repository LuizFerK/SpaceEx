defmodule SpaceexWeb.WelcomeController do
  use SpaceexWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias SpaceexWeb.DocSchemas.DocWelcome

  tags ["Welcome"]

  operation :index,
    summary: "API Welcome",
    responses: [
      ok: {"Welcome response", "application/json", DocWelcome}
    ]

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> text("Back-end Challenge 2021 🏅 - Space Flight News")
  end
end
