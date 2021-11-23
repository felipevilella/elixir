defmodule StudyWeb.SchemaTest do
  use StudyWeb.ConnCase, async: true

  alias Study.User
  alias Study.Users.Create

  describe "users queries" do
    test "when a valid id is give, returns the user", %{conn: conn} do
      params =  %{name: "Julia", email: "julia@hotmail.com", password: "123456"}

      {:ok, %User{id: user_id}} = Create.call(params)


      query = """
      {
        getUser(id: "#{user_id}") {
          id
          email
          name
        }
      }
      """

      response = conn
      |> get("/api/graphql", %{query: query})
      |> json_response(:ok)


      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "julia@hotmail.com",
            "id" => "#{user_id}",
            "name" => "Julia"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "Joao", email: "joao@banana.com", password: "123456"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Joao"}}} = response
    end
  end
end
