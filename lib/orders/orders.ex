defmodule Exlivery.Orders.Order do
  @keys [:user_cpf, :delivery_address, :items, :total_price]

  @enforce_keys @keys

  defstruct @keys

  def build do
    {:ok,
     %__MODULE__{
       user_cpf: nil,
       delivery_address: nil,
       items: nil,
       total_price: nil

     }}
  end

  def build(__user_cpf, __delivery_address, __items, __total_price) do
    {:error, "Invalid parameters"}
  end
end
