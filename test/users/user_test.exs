defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      address = "Rua de para teste de usuario"
      cpf = "22635262814"
      name = "Eduardo"
      email = "edu.grangeiro2002@gmail.com"
      age = 19

      response = User.build(email, name, address, cpf, age)

      expected_response =
        {:ok,
          %User{
          address: "Rua de para teste de usuario",
          age: 19,
          cpf: "22635262814",
          email: "edu.grangeiro2002@gmail.com",
          name: "Eduardo"
        }}

      assert response == expected_response
    end

    test "when age is invalid params, returns an error" do
      address = "Rua de para teste de usuario"
      cpf = "22635262814"
      name = "Eduardo"
      email = "edu.grangeiro2002@gmail.com"
      age = 17

      response = User.build(email, name, address, cpf, age)

      expected_response ={:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when cpf is invalid params, returns an error" do
      address = "Rua de para teste de usuario"
      cpf = 22635262814
      name = "Eduardo"
      email = "edu.grangeiro2002@gmail.com"
      age = 19

      response = User.build(email, name, address, cpf, age)

      expected_response ={:error, "Invalid parameters"}

      assert response == expected_response
    end
  end

end
