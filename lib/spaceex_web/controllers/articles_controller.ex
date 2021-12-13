defmodule SpaceexWeb.ArticlesController do
  use SpaceexWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Spaceex.Article
  alias SpaceexWeb.DocSchemas.{DocArticle, DocArticles, DocNoContent}
  alias SpaceexWeb.FallbackController

  action_fallback FallbackController

  tags ["Articles"]

  # coveralls-ignore-start
  operation :index,
    summary: "List articles",
    parameters: [
      page: [in: :path, description: "Page of list", type: :integer, example: 1, required: false],
      page_size: [
        in: :path,
        description: "Limit of each page",
        type: :integer,
        example: 10,
        required: false
      ]
    ],
    responses: [
      ok: {"Articles list", "application/json", DocArticles}
    ]

  # coveralls-ignore-stop

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

  # coveralls-ignore-start
  operation :show,
    summary: "Get article",
    parameters: [
      id: [in: :path, description: "Article ID", type: :integer, example: 13_236]
    ],
    responses: [
      ok: {"Articles list", "application/json", DocArticle}
    ]

  # coveralls-ignore-stop

  def show(conn, %{"id" => id}) do
    with {:ok, %Article{} = article} <- Spaceex.get_article_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("article.json", article: article)
    end
  end

  # coveralls-ignore-start
  operation :create,
    summary: "Create article",
    request_body: {"Article attributes", "application/json", DocArticle, required: true},
    responses: [
      ok: {"Created articles", "application/json", DocArticle}
    ]

  # coveralls-ignore-stop

  def create(conn, params) do
    with {:ok, %Article{} = article} <- Spaceex.create_article(params) do
      conn
      |> put_status(:created)
      |> render("article.json", article: article)
    end
  end

  # coveralls-ignore-start
  operation :update,
    summary: "Update article",
    parameters: [
      id: [in: :path, description: "Article ID", type: :integer, example: 13_236]
    ],
    request_body: {"Article attributes", "application/json", DocArticle},
    responses: [
      ok: {"Updated articles", "application/json", DocArticle}
    ]

  # coveralls-ignore-stop

  def update(conn, params) do
    with {:ok, %Article{} = article} <- Spaceex.update_article(params) do
      conn
      |> put_status(:ok)
      |> render("article.json", article: article)
    end
  end

  # coveralls-ignore-start
  operation :delete,
    summary: "Delete article",
    parameters: [
      id: [in: :path, description: "Article ID", type: :integer, example: 13_236]
    ],
    responses: [
      no_content: {"No content delete response", "application/json", DocNoContent}
    ]

  # coveralls-ignore-stop

  def delete(conn, %{"id" => id}) do
    with {:ok, %Article{}} <- Spaceex.delete_article(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
