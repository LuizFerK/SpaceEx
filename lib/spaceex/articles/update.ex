defmodule Spaceex.Articles.Update do
  alias Spaceex.{Article, Error, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Article, id) do
      nil -> {:error, Error.build_article_not_found_error()}
      article -> do_update(article, params)
    end
  end

  defp do_update(article, params) do
    article
    |> Article.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Article{}} = result), do: result

  defp handle_update({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
