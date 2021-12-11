defmodule Spaceex.Articles.GetTest do
  use Spaceex.DataCase, async: true

  import Spaceex.Factory

  alias Spaceex.{Article, Error}
  alias Spaceex.Articles.Get

  describe "by_id/1" do
    test "when the item with the given id exists, returns an article" do
      id = 123

      insert(:article, id: id)

      response = Get.by_id(id)

      assert {:ok, %Article{id: ^id}} = response
    end

    test "when the article with the given id does not exists, returns an error" do
      response = Get.by_id(0)

      {:error, %Error{status: :not_found, result: error}} = response

      assert error == "Article not found"
    end
  end
end
