
defmodule Study.IMCTest do
  use ExUnit.Case, async: true

  alias Study.IMC

  describe "calculate/1" do
    test "when the file exist, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
          %{
            "Amanda" => 30.816326530612248,
            "Diego" => 23.04002019946976,
            "Felipe" => 21.63789783270894,
            "Julia" => 29.768932366334962,
            "Rafael" => 25.056656771681187
          }
        }

        assert response == expected_response
    end

    test "when the wrong file exist, returns the data" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

        assert response == expected_response
    end
  end
end
