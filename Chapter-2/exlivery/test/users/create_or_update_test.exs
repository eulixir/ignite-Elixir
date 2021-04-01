defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Jp",
        address: "Rua das bananeiras",
        email: "jp@banana.com",
        cpf: "12345678900",
        age: 19
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are age < 18, returns an error" do
      params = %{
        name: "Jp",
        address: "Rua das bananeiras",
        email: "jp@banana.com",
        cpf: "12345678900",
        age: 17
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Age must be over 18"}

      assert response == expected_response
    end

    test "when there are cpf as integer, returns an error" do
      params = %{
        name: "Jp",
        address: "Rua das bananeiras",
        email: "jp@banana.com",
        cpf: 12_345_678_900,
        age: 19
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Cpf must be a String"}

      assert response == expected_response
    end
  end
end
