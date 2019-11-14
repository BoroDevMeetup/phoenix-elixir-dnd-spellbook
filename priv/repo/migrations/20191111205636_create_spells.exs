defmodule Spellbook.Repo.Migrations.CreateSpells do
  use Ecto.Migration

  def change do
    create table(:spells) do
      add(:name, :string)
      add(:level, :integer)
      add(:description, :text)
      add(:casting_time, :string)
      add(:duration, :string)

      timestamps()
    end
  end
end
