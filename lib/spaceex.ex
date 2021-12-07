defmodule Spaceex do
  alias Spaceex.Articles.Create, as: ArticleCreate
  alias Spaceex.Articles.Delete, as: ArticleDelete
  alias Spaceex.Articles.Get, as: ArticleGet
  alias Spaceex.Articles.GetAll, as: GetAllArticles
  alias Spaceex.Articles.Update, as: ArticleUpdate

  defdelegate create_article(params), to: ArticleCreate, as: :call
  defdelegate delete_article(id), to: ArticleDelete, as: :call
  defdelegate get_article_by_id(id), to: ArticleGet, as: :by_id
  defdelegate update_article(params), to: ArticleUpdate, as: :call
  defdelegate get_all_articles(), to: GetAllArticles, as: :call
end
