defmodule Exmeal.Repo.Migrations.CreateOrderMealsTable do
  use Ecto.Migration

  def change do
    create table(:orders_items, primary_key: false) do
      add :meal_id, references(:meals, type: :binary_id)
      add :users_id, references(:users, type: :binary_id)
    end
  end
end
