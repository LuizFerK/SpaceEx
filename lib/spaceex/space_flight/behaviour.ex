defmodule Spaceex.SpaceFlight.Behaviour do
  alias Spaceex.Error

  @callback get_articles(Integer.t()) :: {:ok, map()} | {:error, Error.t()}
end
