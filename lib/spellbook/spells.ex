defmodule Spellbook.Spells do
  import Ecto.Query, warn: false
  alias Spellbook.Repo

  alias Spellbook.Spells.Spell

  def list_spells do
    Repo.all(Spell)
  end

  def get_spell!(id), do: Repo.get!(Spell, id)

  def create_spell(attrs \\ %{}) do
    %Spell{}
    |> Spell.changeset(attrs)
    |> Repo.insert()
  end

  def update_spell(%Spell{} = spell, attrs) do
    spell
    |> Spell.changeset(attrs)
    |> Repo.update()
  end

  def delete_spell(%Spell{} = spell) do
    Repo.delete(spell)
  end

  def change_spell(%Spell{} = spell) do
    Spell.changeset(spell, %{})
  end
end
