defmodule Spaceex.Article do
  use Ecto.Schema
  import Ecto.Changeset

  alias Spaceex.Articles.Event

  @primary_key {:id, :integer, autogenerate: false}

  @params [
    :id,
    :featured,
    :title,
    :url,
    :imageUrl,
    :newsSite,
    :summary,
    :updatedAt,
    :publishedAt
  ]

  @required_params @params ++ [:launches, :events]

  @derive {Jason.Encoder, only: @required_params}

  schema "articles" do
    field :featured, :boolean
    field :title, :string
    field :url, :string
    field :imageUrl, :string
    field :newsSite, :string
    field :summary, :string
    field :updatedAt, :string
    field :publishedAt, :string
    embeds_many :launches, Event, on_replace: :delete
    embeds_many :events, Event, on_replace: :delete

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @params)
    |> cast_embed(:launches)
    |> cast_embed(:events)
    |> validate_required(@required_params)
    |> unique_constraint(:id, name: :articles_pkey)
  end
end
