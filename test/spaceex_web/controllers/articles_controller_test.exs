defmodule Spaceex.ArticlesControllerTest do
  use SpaceexWeb.ConnCase, async: true

  import Spaceex.Factory

  describe "create/2" do
    test "when all params are valid, creates the article", %{conn: conn} do
      params = build(:article_params)

      response =
        conn
        |> post(Routes.articles_path(conn, :create), params)
        |> json_response(:created)

      assert ^params = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = build(:article_params, %{"featured" => "invalid_featured_type"})

      response =
        conn
        |> post(Routes.articles_path(conn, :create), params)
        |> json_response(:bad_request)

      expected_response = %{"error" => %{"featured" => ["is invalid"]}}

      assert response == expected_response
    end

    test "when the id is already taken, returns an error", %{conn: conn} do
      id = 0

      insert(:article, id: id)

      params = build(:article_params, %{"id" => id})

      response =
        conn
        |> post(Routes.articles_path(conn, :create), params)
        |> json_response(:bad_request)

      expected_response = %{"error" => %{"id" => ["has already been taken"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      id = 0

      insert(:article, id: id)

      {:ok, conn: conn, id: id}
    end

    test "when there is an article with the given id, deletes the article", %{conn: conn, id: id} do
      response =
        conn
        |> delete(Routes.articles_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there is no article with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.articles_path(conn, :delete, 123))
        |> json_response(:not_found)

      assert response == %{"error" => "Article not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> delete(Routes.articles_path(conn, :delete, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "index/2" do
    test "should return all articles", %{conn: conn} do
      insert(:article, id: 0)
      insert(:article, id: 1)

      response =
        conn
        |> get(Routes.articles_path(conn, :index))
        |> json_response(:ok)

      assert [%{"id" => 0}, %{"id" => 1}] = response
    end

    test "if there is no articles is database, should return an empty list", %{conn: conn} do
      response =
        conn
        |> get(Routes.articles_path(conn, :index))
        |> json_response(:ok)

      assert [] = response
    end

    test "when there are valid query params, should paginate correctly", %{conn: conn} do
      insert(:article, id: 0)
      insert(:article, id: 1)
      insert(:article, id: 2)

      response =
        conn
        |> get(Routes.articles_path(conn, :index, page: 2, page_size: 1))
        |> json_response(:ok)

      assert [%{"id" => 1}] = response
    end
  end

  describe "show/2" do
    setup %{conn: conn} do
      id = 0

      insert(:article, id: id)

      {:ok, conn: conn, id: id}
    end

    test "when there is an article with the given id, returns the article", %{conn: conn, id: id} do
      response =
        conn
        |> get(Routes.articles_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => 0} = response
    end

    test "when there is no article with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.articles_path(conn, :show, 123))
        |> json_response(:not_found)

      assert response == %{"error" => "Article not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> get(Routes.articles_path(conn, :show, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end

  describe "update/2" do
    setup %{conn: conn} do
      id = 0

      insert(:article, id: id)

      {:ok, conn: conn, id: id}
    end

    test "when there is an article with the given id, update the article", %{conn: conn, id: id} do
      params = %{"featured" => true}

      response =
        conn
        |> put(Routes.articles_path(conn, :update, id), params)
        |> json_response(:ok)

      assert %{"id" => ^id, "featured" => true} = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, id: id} do
      params = %{"featured" => "invalid_featured_type"}

      response =
        conn
        |> put(Routes.articles_path(conn, :update, id), params)
        |> json_response(:bad_request)

      assert %{"error" => %{"featured" => ["is invalid"]}} = response
    end

    test "when there is no article with the given id, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.articles_path(conn, :update, "123"))
        |> json_response(:not_found)

      assert response == %{"error" => "Article not found"}
    end

    test "when the id format is invalid, returns an error", %{conn: conn} do
      response =
        conn
        |> put(Routes.articles_path(conn, :update, "invalid_id"))
        |> json_response(:bad_request)

      assert response == %{"message" => "Invalid id format"}
    end
  end
end
