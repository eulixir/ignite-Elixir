defmodule ListLenghtTest do
  use ExUnit.Case

  describe "call/1" do
    test "count list elements" do
      list = [1, 2, 3, 4, 5, 6]

      response = ListLenght.list_length(list)

      expected_response = 6

      assert response == expected_response
    end
  end
end
