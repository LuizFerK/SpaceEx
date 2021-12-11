defmodule Spaceex.Articles.UpdateTest do
  use Spaceex.DataCase, async: true
  import Spaceex.Factory

  alias Spaceex.{Article, Error}
  alias Spaceex.Articles.Update

  describe "call/1" do
    setup do
      id = 0

      insert(:article, id: id)

      {:ok, id: id}
    end

    test "when all params are valid, updates the article", %{id: id} do
      params = build(:article_params, %{"id" => id})

      response = Update.call(params)

      assert {:ok, %Article{id: ^id}} = response
    end

    test "when an invalid id is given, returns an error" do
      params = build(:article_params, %{"id" => 123})

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end

    test "when invalid params are given, returns an error", %{id: id} do
      params =
        build(:article_params, %{
          "id" => id,
          "featured" => "invalid_featured_type"
        })

      response = Update.call(params)

      assert {:error, %Error{}} = response
    end
  end
end
