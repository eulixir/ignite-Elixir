defmodule ReportsGeneratorTest do
  use ExUnit.Case

  @file_name "report_test.csv"

  describe("build/1") do
    test "build reports" do
      response = report = ReportsGenerator.build(@file_name)

      expected_response = report

      assert response == expected_response
    end
  end

  describe "fetch_higher_cost/2" do
    test "when the option is 'users', returns the user who spent the most" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("users")

      expected_response = {:ok, {"5", 49}}

      assert response == expected_response
    end
  end

  test "when the option is 'foods', returns the most consumed food" do
    response =
      @file_name
      |> ReportsGenerator.build()
      |> ReportsGenerator.fetch_higher_cost("foods")

    expected_response = {:ok, {"esfirra", 3}}

    assert response == expected_response
  end

  test "when an invalid option as given, returns an error" do
    response =
      @file_name
      |> ReportsGenerator.build()
      |> ReportsGenerator.fetch_higher_cost("user")

    expected_response = {:error, "Invalid option!"}

    assert response == expected_response
  end
end
