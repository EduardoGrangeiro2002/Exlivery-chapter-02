defmodule Exlivery.Users.User do
  @keys [:name, :address, :email, :cpf, :age]
  @enforce_keys @keys

  defstruct @keys

  def build(email, name, address, cpf, age) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       address: address,
       email: email,
       cpf: cpf,
       age: age
     }}
  end

  def build(__address, _name, _email, _cpf, _age), do: {:error, "Invalid parameters"}
end
