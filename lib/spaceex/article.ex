defmodule Spaceex.Article do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:featured, :title, :url, :imageUrl, :newsSite, :summary, :publishedAt]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "articles" do
    field :featured, :boolean
    field :title, :string
    field :url, :string
    field :imageUrl, :string
    field :newsSite, :string
    field :summary, :string
    field :publishedAt, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
