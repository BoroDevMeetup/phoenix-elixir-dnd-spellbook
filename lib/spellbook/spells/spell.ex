defmodule Spellbook.Spells.Spell do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spells" do
    field :name, :string
    field :level, :integer
    field :description, :string
    field :casting_time, :string
    field :duration, :string

    timestamps()
  end

  @doc false
  def changeset(spell, attrs) do
    spell
    |> cast(attrs, [:name, :level, :description, :casting_time, :duration])
    |> validate_required([:name, :level, :description])
  end
end
