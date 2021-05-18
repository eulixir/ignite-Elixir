defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :date, :date
      add :calories, :integer
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
