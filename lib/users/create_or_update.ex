defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users
  alias Users.User
  alias Users.Agent, as: UserAgent

  def call(%{name: name, address: address, email: email, cpf: cpf, age: age}) do
    email
    |> User.build(name, address, cpf, age)
    |>save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)

    {:ok, "Users was created or updated succesfully"}
  end
  defp save_user({:error, __reason} = error), do: error
end
