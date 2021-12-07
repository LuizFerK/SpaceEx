defmodule Spaceex.Articles.Delete do
  alias Spaceex.{Article, Error, Repo}

  def call(id) do
    case Repo.get(Article, id) do
      nil -> {:error, Error.build_article_not_found_error()}
      article -> Repo.delete(article)
    end
  end
end
