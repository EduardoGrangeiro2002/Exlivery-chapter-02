defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Eduardo",
      email: "eduardo.grangeiro@gmail.com",
      cpf: "123456789",
      age: 19,
      address: "Vila aparecida, 91"
    }
  end
    def item_factory do
      %Item{
        description: "Panqueca",
        category: :prato_feito,
        quantity: 8,
        unity_price: Decimal.new("50.5")
      }
    end

end
