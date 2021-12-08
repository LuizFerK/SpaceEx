defmodule Spaceex.GetArticles do
  alias Spaceex.{Error, Repo}
  alias Spaceex.SpaceFlight.Client, as: SpaceFlight

  def call(limit) do
    case SpaceFlight.get_articles(limit) do
      {:ok, articles} -> handle_response(articles)
      {:error, %Error{}} = error -> error
    end
  end

  def handle_response(articles) do
    parsed_articles =
      Enum.map(articles, fn article ->
        article
        |> Map.put(:inserted_at, NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second))
        |> Map.put(:updated_at, NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second))
      end)

    "articles"
    |> Repo.insert_all(parsed_articles)
  end
end
