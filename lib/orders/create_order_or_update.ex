defmodule Exlivery.Orders.CreateOrUpdate do

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent


  def call(%{user_cpf: user_cpf, items: items}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user,items)
      OrderAgent.save(order)
    else
      error -> error
  end

  defp build_items() do

  end
end
