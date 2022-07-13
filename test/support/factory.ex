defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Eduardo",
      email: "eduardo.grangeiro@gmail.com",
      cpf: "123456789",
      age: 19,
      address: "Vila aparecida, 91"
    }
  end

end
