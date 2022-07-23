defmodule  Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do

    setup  do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{name: "Eduardo", address: "Lavapes", email: "eduardo.grangeiro@znap.com.br", cpf: "1245421421421124", age: 19}

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Users was created or updated succesfully"}

      assert response == expected_response
    end

    test "when there  are invalid params, returns an error" do
      params = %{name: "Eduardo", address: "Lavapes", email: "eduardo.grangeiro@znap.com.br", cpf: "1245421421421124", age: 17}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
