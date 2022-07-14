defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  alias Exlivery.Orders.Item

  alias Exlivery.Orders.Order


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

    def order_factory do
      %Order{
        delivery_address: "Vila aparecida, 91",
        items: [
          build(:item),
          build(:item, description: "Hamburguer", category: :hamburguer, unity_price: Decimal.new("25.59"), quantity: 2)],
        total_price: Decimal.new("455.18"),
        user_cpf: "123456789"
      }
    end

end
