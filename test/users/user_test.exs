defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      address = "Vila aparecida, 91"
      cpf = "123456789"
      name = "Eduardo"
      email = "eduardo.grangeiro@gmail.com"
      age = 19

      response = User.build(email, name, address, cpf, age)

      expected_response =
        {:ok, build(:user)}

      assert response == expected_response
    end

    test "when age is invalid params, returns an error" do
      address = "Vila aparecida, 91"
      cpf = "123456789"
      name = "Eduardo"
      email = "eduardo.grangeiro@gmail.com"
      age = 17

      response = User.build(email, name, address, cpf, age)

      expected_response ={:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when cpf is invalid params, returns an error" do
      address = "Vila aparecida, 91"
      cpf = 123456789
      name = "Eduardo"
      email = "eduardo.grangeiro@gmail.com"
      age = 19

      response = User.build(email, name, address, cpf, age)

      expected_response ={:error, "Invalid parameters"}

      assert response == expected_response
    end
  end

end
