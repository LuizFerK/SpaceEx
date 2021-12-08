defmodule Spaceex.SpaceFlight.Client do
  use Tesla

  alias Spaceex.Error
  alias Spaceex.SpaceFlight.Behaviour

  alias(Tesla.Env)

  @behaviour Behaviour

  @base_url "https://api.spaceflightnewsapi.net/v3/"
  plug Tesla.Middleware.JSON

  def get_articles(base_url \\ @base_url, limit) do
    "#{base_url}articles?_limit=#{limit}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}
end
