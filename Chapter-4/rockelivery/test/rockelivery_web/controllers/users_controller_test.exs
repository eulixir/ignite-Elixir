defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua das bananeiras, 15",
        "cep" => "12345678",
        "cpf" => "12345678900",
        "email" => "jp@banana.com",
        "password" => "123456",
        "name" => "Jp"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(201)

      assert %{
               "message" => "User created",
               "user" => %{
                 "user" => %{
                   "address" => "Rua das bananeiras, 15",
                   "age" => 27,
                   "cep" => "12345678",
                   "cpf" => "12345678900",
                   "email" => "jp@banana.com",
                   "id" => _id,
                   "name" => "Jp"
                 }
               }
             } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123",
        "name" => "Jp"
      }

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "password" => ["should be at least 6 character(s)"]
        }
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(400)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with given id, deletes the user", %{conn: conn} do
      id = "69961117-d966-4e2f-ac55-476d4f78ddfa"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(204)

      assert response == ""
    end
  end
end
