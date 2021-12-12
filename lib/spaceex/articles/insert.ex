defmodule Spaceex.Articles.Insert do
  alias Spaceex.{Article, Error, Repo}
  alias Spaceex.Articles.Event

  def call(limit) do
    case client().get_articles(limit) do
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
      |> Map.put(:launches, cast_embeddeds(article["launches"]))
      |> Map.put(:events, cast_embeddeds(article["events"]))
    end)
  end

  defp cast_embeddeds(embeddeds) do
    Enum.map(embeddeds, fn embedded ->
      %Event{id: embedded["id"], provider: embedded["provider"]}
    end)
  end

  defp client do
    :spaceex
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:space_flight_adapter)
  end
end
