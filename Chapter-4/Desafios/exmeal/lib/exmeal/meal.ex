defmodule Exmeal.Meal do
  use Ecto.Schema

  alias Exmeal.User

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories]

  schema "meals" do
    field :description, :string
    field :date, :date
    field :calories, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calories, greater_than_or_equal_to: 0)
  end
end
