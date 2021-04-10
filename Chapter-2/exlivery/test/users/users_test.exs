defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua das pencas, casa 1",
          "Jp",
          "jp@banana.com",
          "112250055",
          19
        )

      expected_response = {:ok, build(:users)}

      assert response == expected_response
    end

    test "when agr must be over 18" do
      response =
        User.build(
          "Jp",
          "Rua das pencas, casa 1",
          "jp@banana.com",
          "112250055",
          17
        )

      assert response == {:error, "Age must be over 18"}
    end

    test "when cpf as integer" do
      response =
        User.build(
          "Jp",
          "Rua dos caixos, casa 1",
          "jp@banana.com",
          112_250_055,
          19
        )

      assert response == {:error, "Cpf must be a String"}
    end

    # test "when are invalid paramters" do
    #   response =
    #     User.build(
    #       "Rua dos cachos",
    #       nil,
    #       "jp@banana.com",
    #       "123318900",
    #       19
    #     )

    #   assert response == {:error, "Invalid paramters"}
    # end
  end
end
