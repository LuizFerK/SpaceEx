defmodule Spaceex.SpaceFlight.Behaviour do
  alias Spaceex.Error

  @callback get_articles(Integer.t()) :: {:ok, list()} | {:error, Error.t()}
end
