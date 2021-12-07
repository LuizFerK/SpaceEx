defmodule Spaceex.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result), do: %__MODULE__{status: status, result: result}

  def build_article_not_found_error, do: build(:not_found, "Article not found")
end
