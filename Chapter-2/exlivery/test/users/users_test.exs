defmodule ExUnit.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all param are valid, returns the user" do
      response =
        User.build(
          "Rua dos cachos",
          "Jp",
          "jp@banana.com",
          "12345678900",
          19
        )

      expected_response = {:ok, %User{
        address: "Rua dos cachos",
        age: 19, cpf: "12345678900",
        email: "jp@banana.com",
        name: "Jp"
      }}

      assert response == expected_response
    end

    test "when agr must be over 18" do
      response =
        User.build(
          "Rua dos cachos",
          "Jp Jr",
          "jp@banana.com",
          "123318900",
          17
        )

      assert response == {:error, "Age must be over 18"}
    end

    test "when cpf as integer" do
      response =
        User.build(
          "Rua dos cachos",
          "Jp",
          "jp@banana.com",
          123318900,
          19
        )

      assert response == {:error, "Cpf must be a String"}
    end

    test "when are invalid paramters" do
      response =
        User.build(
          "Rua dos cachos",
          nil,
          "jp@banana.com",
          "123318900",
          19
        )

      assert response == {:error, "Invalid paramters"}
    end

  end
end
