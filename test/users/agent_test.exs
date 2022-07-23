defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)
      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup  do
      UserAgent.start_link(%{})

      cpf = "2415125321"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |>build(cpf: cpf)
      |>UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response = {:ok,
      %Exlivery.Users.User{
      address: "Vila aparecida, 91",
      age: 19,
      cpf: "2415125321",
      email: "eduardo.grangeiro@gmail.com",
      name: "Eduardo"
    }}

      assert expected_response == response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("0000000000")

      expected_response = {:error, "User not found!"}

      assert response == expected_response
    end
  end
end
