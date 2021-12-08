defmodule Spaceex.Article do
  use Ecto.Schema
  import Ecto.Changeset

  alias Spaceex.Articles.Event

  @primary_key {:id, :binary_id, autogenerate: true}

  @params [
    :featured,
    :title,
    :url,
    :imageUrl,
    :newsSite,
    :summary,
    :publishedAt
  ]

  @required_params @params ++ [:launches, :events]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "articles" do
    field :featured, :boolean
    field :title, :string
    field :url, :string
    field :imageUrl, :string
    field :newsSite, :string
    field :summary, :string
    field :publishedAt, :string
    embeds_many :launches, Event
    embeds_many :events, Event

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @params)
    |> cast_embed(:launches)
    |> cast_embed(:events)
    |> validate_required(@required_params)
  end
end
