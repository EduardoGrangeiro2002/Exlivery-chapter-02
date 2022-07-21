defmodule Exlivery do
  alias Exlivery.Users
  alias Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Users.Agent, as: UserAgent
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call

end
