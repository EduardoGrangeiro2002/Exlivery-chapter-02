defmodule Exlivery do
  alias Exlivery.Users
  alias Users.CreateOrUpdate
  alias Users.Agent, as: UserAgent

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update(params), to: CreateOrUpdate, as: :call
end
