defmodule SpaceexWeb.ArticlesController do
  use SpaceexWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Spaceex.Article
  alias SpaceexWeb.DocSchemas.Article, as: DocArticle
  alias SpaceexWeb.FallbackController

  action_fallback FallbackController

  tags ["articles"]

  operation :index,
    summary: "List articles",
    parameters: [
      id: [in: :path, description: "User ID", type: :integer, example: 1001]
    ],
    responses: [
      ok: {"Article response", "application/json", DocArticle}
    ]

  def index(conn, params) do
    with {:ok, [%Article{} | _] = articles} <- Spaceex.get_all_articles(params) do
      conn
      |> put_status(:ok)
      |> render("articles.json", articles: articles)
    else
      {:ok, [] = articles} ->
        conn
        |> put_status(:ok)
        |> render("articles.json", articles: articles)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Article{} = article} <- Spaceex.get_article_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("article.json", article: article)
    end
  end

  def create(conn, params) do
    with {:ok, %Article{} = article} <- Spaceex.create_article(params) do
      conn
      |> put_status(:created)
      |> render("article.json", article: article)
    end
  end

  def update(conn, params) do
    with {:ok, %Article{} = article} <- Spaceex.update_article(params) do
      conn
      |> put_status(:ok)
      |> render("article.json", article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Article{}} <- Spaceex.delete_article(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
