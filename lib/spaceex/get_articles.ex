defmodule Spaceex.GetArticles do
  alias Spaceex.{Article, Error, Repo}
  alias Spaceex.SpaceFlight.Client, as: SpaceFlight

  def call(limit) do
    case SpaceFlight.get_articles(limit) do
      {:ok, articles} -> handle_response(articles)
      {:error, %Error{}} = error -> error
    end
  end

  defp handle_response(articles) do
    Article
    |> Repo.insert_all(parse_articles_maps(articles),
      on_conflict: :replace_all,
      conflict_target: :id
    )
  end

  defp parse_articles_maps(articles) do
    Enum.map(articles, fn article ->
      article
      |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
      |> Map.put(:inserted_at, NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second))
      |> Map.put(:updated_at, NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second))
    end)
  end
end
