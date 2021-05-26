defmodule GetRepo.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @derive {Jason.Encoder, only: [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:password]

  schema "users" do
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
