defmodule Spaceex.Articles.InsertTest do
  use Spaceex.DataCase, async: true

  import Mox
  import Spaceex.Factory

  alias Spaceex.Articles.Insert
  alias Spaceex.Error
  alias Spaceex.SpaceFlight.ClientMock

  describe "call/1" do
    test "should insert all the space flight articles" do
      expect(ClientMock, :get_articles, fn _ ->
        {:ok, [build(:article_params, %{"id" => 0}), build(:article_params, %{"id" => 1})]}
      end)

      response = Insert.call(0)

      expected_response = {2, nil}

      assert response == expected_response
    end

    test "should insert all the space flight articles with limit" do
      expect(ClientMock, :get_articles, fn _ ->
        {:ok, [build(:article_params, %{"id" => 0})]}
      end)

      response = Insert.call(1)

      expected_response = {1, nil}

      assert response == expected_response
    end

    test "when there are invalid params, should return an error" do
      expect(ClientMock, :get_articles, fn _ -> {:error, Error.build(:bad_request, "")} end)

      response = Insert.call("invalid_param")

      assert {:error, %Error{status: :bad_request}} = response
    end
  end
end
