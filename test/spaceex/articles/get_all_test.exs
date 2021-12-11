defmodule Spaceex.Articles.GetAllTest do
  use Spaceex.DataCase, async: true

  import Spaceex.Factory

  alias Spaceex.Article
  alias Spaceex.Articles.GetAll

  describe "call/1" do
    test "should return all articles in database" do
      insert(:article, id: 0)
      insert(:article, id: 1)

      response = GetAll.call(nil)

      assert {:ok, [%Article{id: 0}, %Article{id: 1}]} = response
    end

    test "if there is no articles in database, should return an empty list" do
      response = GetAll.call(nil)

      assert {:ok, []} = response
    end

    test "when there are valid query params, should paginate correctly" do
      insert(:article, id: 0)
      insert(:article, id: 1)
      insert(:article, id: 2)

      response = GetAll.call(%{"page" => 2, "page_size" => 1})

      assert {:ok, [%Article{id: 1}]} = response
    end
  end
end
