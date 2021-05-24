defmodule GetRepo.Client.UserRepoTest do
  use ExUnit.Case, async: true

  import GetRepo.Factory

  alias GetRepo.Client.{Parser, UserRepo}
  alias Plug.Conn
  alias GetRepo.Error

  describe "get_user_repos/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when username exist, returns the repos", %{bypass: bypass} do
      username = "joaopealves"
      body = build(:user_repos_body)
      url = bypass_url(bypass.port)

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = UserRepo.get_user_repos(url, username)

      expected_response = {
        :ok,
        [
          %Parser{
            description:
              "Projeto desenvolvido durante a Next Level Week, feito pela @Rocketseat com 💜",
            html_url: "https://github.com/joaopealves/inmana",
            id: 359_424_756,
            name: "inmana",
            stargazers_count: 8
          }
        ]
      }

      assert expected_response == response
    end

    test "returns an error if user doesn't exist", %{bypass: bypass} do
      username = "'"
      url = bypass_url(bypass.port)

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.resp(404, "")
      end)

      response = UserRepo.get_user_repos(url, username)

      expected_response =
        {:error, %Error{result: "Username not found!", status: :not_found}}

      assert expected_response == response
    end

    test "returns an error if server is down", %{bypass: bypass} do
      username = "joaopealves"
      url = bypass_url(bypass.port)

      Bypass.down(bypass)

      response = UserRepo.get_user_repos(url, username)

      expected_response = {:error, %Error{result: :econnrefused, status: :bad_request}}
      assert expected_response == response
    end
  end

  defp bypass_url(port), do: "http://localhost:#{port}"
end
