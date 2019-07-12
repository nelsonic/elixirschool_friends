defmodule Friends.Person do
    use Ecto.Schema
    import Ecto.Changeset

    schema "people" do
      field :name, :string
      field :age, :integer, default: 0
    end

    def changeset(struct, params) do
      struct
      |> cast(params, [:name])
      |> set_name_if_anonymous()
      |> validate_required([:name])
      |> validate_length(:name, min: 2)
      |> validate_fictional_name()
    end

    @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]
    def validate_fictional_name(changeset) do
      name = get_field(changeset, :name)

      if name in @fictional_names do
        changeset
      else
        add_error(changeset, :name, "is not a superhero")
      end
    end

    def set_name_if_anonymous(changeset) do
      name = get_field(changeset, :name)

      if is_nil(name) do
        put_change(changeset, :name, "Anonymous")
      else
        changeset
      end
    end

  end
