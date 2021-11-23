defmodule StudyWeb.IMCControllerTest do
  use StudyWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params area valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
            "Amanda" => 30.816326530612248,
            "Diego" => 23.04002019946976,
            "Felipe" => 21.63789783270894,
            "Julia" => 29.768932366334962,
            "Rafael" => 25.056656771681187
            }
          }

        assert response == expected_response
    end


    test "when all params area invalid, returns an error", %{conn: conn} do
      params = %{"filename" => "students1123.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response =  %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
