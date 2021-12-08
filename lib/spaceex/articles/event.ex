defmodule Spaceex.Articles.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  @required_params [:id, :provider]

  @derive {Jason.Encoder, only: @required_params}

  embedded_schema do
    field :id, :string
    field :provider, :string
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
