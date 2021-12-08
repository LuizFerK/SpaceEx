defmodule Spaceex.Articles.Create do
  alias Spaceex.{Article, Error, Repo}

  def call(params) do
    params
    |> Article.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Article{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
