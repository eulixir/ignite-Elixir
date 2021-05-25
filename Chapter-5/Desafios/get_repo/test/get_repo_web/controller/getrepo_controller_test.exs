defmodule GetRepoWeb.GetRepoControllerTest do
  use GetRepoWeb.ConnCase, async: true

  import Mox

  import GetRepo.Factory

  alias GetRepo.Client.UserRepoMock
  alias GetRepo.Error
  alias GetRepoWeb.Auth.Guardian

  describe "create/2" do
    setup %{conn: conn} do
      params = %{password: "banana"}

      user =
        params
        |> GetRepo.User.changeset()
        |> GetRepo.Repo.insert()

        IO.inspect(Guardian.encode_and_sign(user))
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when the user exist, return a map", %{conn: conn} do
      username = "joaopealves"

      expect(UserRepoMock, :get_user_repos, fn _username -> {:ok, build_list(1, :repo_info)} end)

      response =
        conn
        |> get(Routes.get_repo_path(conn, :show, username, []))
        |> json_response(:ok)

      assert %{
               "user_repos" => [
                 %{
                   "description" =>
                     "Projeto desenvolvido durante a Next Level Week, feito pela @Rocketseat com 💜",
                   "html_url" => "https://github.com/joaopealves/inmana",
                   "id" => 359_424_756,
                   "name" => "inmana",
                   "stargazers_count" => 8
                 }
               ]
             } = response
    end

    test "returns an error if user doesn't exist", %{conn: conn} do
      expect(UserRepoMock, :get_user_repos, fn _username ->
        {:error, Error.build(:not_found, "Username not found!")}
      end)

      response =
        conn
        |> get(Routes.get_repo_path(conn, :show, "'", []))
        |> json_response(:not_found)

      assert %{"message" => "Username not found!"} = response
    end
  end
end
