defmodule Spaceex.Repo.Migrations.CreateArticlesTable do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :featured, :boolean
      add :title, :string
      add :url, :string
      add :imageUrl, :string
      add :newsSite, :string
      add :summary, :string
      add :updatedAt, :string
      add :publishedAt, :string
      add :launches, {:array, :map}, default: []
      add :events, {:array, :map}, default: []

      timestamps()
    end
  end
end
