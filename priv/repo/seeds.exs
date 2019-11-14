# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Spellbook.Repo.insert!(%Spellbook.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#
# Stream json file from static directory
# Use Jason library to decode the JSON into maps
#
# Use empty spell struct for base of spell changeset
# Create an ecto changeset of each spell
# Insert the changeset into the database

alias Spellbook.Repo
alias Spellbook.Spells.Spell

defmodule Spellbook.Seeds do
  def store_spell({spell_name, spell_params}) do
    spell_params = Map.merge(%{"name" => spell_name}, spell_params)

    %Spell{}
    |> Spell.changeset(spell_params)
    |> Repo.insert!()
  end
end

"#{:code.priv_dir(:spellbook)}/repo/spells.json"
|> File.read!()
|> Jason.decode!()
|> Enum.each(&Spellbook.Seeds.store_spell/1)
