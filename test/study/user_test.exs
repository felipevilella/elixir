defmodule Study.UserTest do
  use Study.DataCase, async: true

  alias Study.User
  describe "changeset/1" do
    test "when all params are valid, returns a valid changest" do
      params = %{name: "Julia", email: "julia@hotmail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Julia", email: "julia@hotmail.com", password: "123456"},
        errors: []
      } = response
    end

    test "when all params are invalid params, returns a invalid changest" do
      params = %{name: "J", email: "julia@hotmail.com", password: ""}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
