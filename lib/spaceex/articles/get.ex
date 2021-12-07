defmodule Spaceex.Articles.Get do
  alias Spaceex.{Article, Error, Repo}

  def by_id(id) do
    case Repo.get(Article, id) do
      nil -> {:error, Error.build_article_not_found_error()}
      article -> {:ok, article}
    end
  end
end
