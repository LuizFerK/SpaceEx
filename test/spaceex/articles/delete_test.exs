defmodule Spaceex.Articles.DeleteTest do
  use Spaceex.DataCase, async: true
  import Spaceex.Factory

  alias Spaceex.{Article, Error}
  alias Spaceex.Articles.Delete

  describe "call/1" do
    setup do
      id = 0

      insert(:article, id: id)

      {:ok, id: id}
    end

    test "when a valid id is given, delete the article", %{id: id} do
      response = Delete.call(id)

      assert {:ok, %Article{}} = response
    end

    test "when an invalid id is given, returns an error" do
      response = Delete.call(123)

      assert {:error, %Error{result: "Article not found", status: :not_found}} = response
    end
  end
end
