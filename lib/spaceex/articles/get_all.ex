defmodule Spaceex.Articles.GetAll do
  alias Spaceex.{Article, Repo}

  def call, do: {:ok, Repo.all(Article)}
end
