defmodule Spaceex.Articles.GetAll do
  alias Spaceex.{Article, Repo}

  def call(%{"page" => page, "page_size" => page_size}) do
    %{entries: articles} = Repo.paginate(Article, page: page, page_size: page_size)

    {:ok, articles}
  end

  def call(_params), do: {:ok, Repo.all(Article)}
end
