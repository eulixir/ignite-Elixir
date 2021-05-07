defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Error
  alias Rockelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok,
              %Rockelivery.User{
                address: "Rua das bananeiras, 15",
                age: 27,
                cep: "12345678",
                cpf: "12345678900",
                email: "jp@banana.com",
                id: _id,
                name: "Jp"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 17, password: "123"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      assert errors_on(changeset) == expected_response
    end
  end
end
