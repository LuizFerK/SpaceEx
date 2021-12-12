defmodule SpaceexWeb.Plugs.IDChecker do
  import Plug.Conn

  alias Plug.Conn

  # coveralls-ignore-start
  def init(options), do: options
  # coveralls-ignore-stop

  def call(%Conn{params: %{"id" => id}} = conn, _opts) when is_integer(id), do: conn

  def call(%Conn{params: %{"id" => id}} = conn, _opts) do
    case Integer.parse(id) do
      {_, ""} -> conn
      _ -> render_error(conn)
    end
  end

  def call(conn, _opts), do: conn

  defp render_error(conn) do
    body = Jason.encode!(%{message: "Invalid id format"})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
