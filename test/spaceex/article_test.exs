defmodule Spaceex.ArticleTest do
  use Spaceex.DataCase, async: true

  import Spaceex.Factory

  alias Ecto.Changeset
  alias Spaceex.Article

  describe "changeset/2" do
    test "when all params are valid, return a valid changeset" do
      params = build(:article_params)

      response = Article.changeset(params)

      assert %Changeset{changes: %{id: 13_247}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid chageset with the given changes" do
      params = build(:article_params)

      update_params = %{
        "featured" => true
      }

      response =
        params
        |> Article.changeset()
        |> Article.changeset(update_params)

      assert %Changeset{changes: %{id: 13_247}, valid?: true} = response
    end

    test "when there is some error, returns an invalid changeset" do
      params = build(:article_params, %{"featured" => "invalid_featured_type"})

      response = Article.changeset(params)

      expected_response = %{featured: ["is invalid"]}

      assert errors_on(response) == expected_response
    end

    test "when updating a changeset, if there is some error, returns an invalid changeset" do
      params = build(:article_params)

      update_params = build(:article_params, %{"featured" => "invalid_featured_type"})

      response =
        params
        |> Article.changeset()
        |> Article.changeset(update_params)

      expected_response = %{featured: ["is invalid"]}

      assert errors_on(response) == expected_response
    end
  end
end
