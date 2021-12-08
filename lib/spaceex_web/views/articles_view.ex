defmodule SpaceexWeb.ArticlesView do
  use SpaceexWeb, :view

  alias Spaceex.Article

  def render("article.json", %{article: %Article{} = article}), do: article

  def render("articles.json", %{articles: articles}), do: articles
end
