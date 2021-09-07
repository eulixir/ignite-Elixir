defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:users)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :users
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua das pencas, casa 1",
           age: 19,
           cpf: "12345678900",
           email: "jp@banana.com",
           name: "Jp"
         }}

      assert response == expected_response
    end

    test "when the user is notfound, returns an error" do
      :users
      |> build(cpf: "12345678901")
      |> UserAgent.save()

      response = UserAgent.get("12345678900")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
