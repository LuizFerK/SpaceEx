defmodule Spaceex.Articles.CreateTest do
  use Spaceex.DataCase, async: true

  import Spaceex.Factory

  alias Spaceex.{Article, Error}
  alias Spaceex.Articles.Create

  describe "call/1" do
    test "when all params are valid, returns the created article" do
      params = build(:article_params)

      response = Create.call(params)

      assert {:ok, %Article{id: 13_247}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:article_params, %{"featured" => "invelid_featured_type"})

      assert {:error, %Error{status: :bad_request, result: changeset}} = Create.call(params)

      expected_response = %{featured: ["is invalid"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
