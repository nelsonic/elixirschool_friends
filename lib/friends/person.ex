defmodule Friends.Person do
    use Ecto.Schema
  
    schema "people" do
      field :name, :string
      field :age, :integer, default: 0
    end
  end