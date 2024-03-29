defmodule Spellbook.SpellsTest do
  use Spellbook.DataCase

  alias Spellbook.Spells

  describe "spells" do
    alias Spellbook.Spells.Spell

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def spell_fixture(attrs \\ %{}) do
      {:ok, spell} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Spells.create_spell()

      spell
    end

    test "list_spells/0 returns all spells" do
      spell = spell_fixture()
      assert Spells.list_spells() == [spell]
    end

    test "get_spell!/1 returns the spell with given id" do
      spell = spell_fixture()
      assert Spells.get_spell!(spell.id) == spell
    end

    test "create_spell/1 with valid data creates a spell" do
      assert {:ok, %Spell{} = spell} = Spells.create_spell(@valid_attrs)
      assert spell.name == "some name"
    end

    test "create_spell/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Spells.create_spell(@invalid_attrs)
    end

    test "update_spell/2 with valid data updates the spell" do
      spell = spell_fixture()
      assert {:ok, %Spell{} = spell} = Spells.update_spell(spell, @update_attrs)
      assert spell.name == "some updated name"
    end

    test "update_spell/2 with invalid data returns error changeset" do
      spell = spell_fixture()
      assert {:error, %Ecto.Changeset{}} = Spells.update_spell(spell, @invalid_attrs)
      assert spell == Spells.get_spell!(spell.id)
    end

    test "delete_spell/1 deletes the spell" do
      spell = spell_fixture()
      assert {:ok, %Spell{}} = Spells.delete_spell(spell)
      assert_raise Ecto.NoResultsError, fn -> Spells.get_spell!(spell.id) end
    end

    test "change_spell/1 returns a spell changeset" do
      spell = spell_fixture()
      assert %Ecto.Changeset{} = Spells.change_spell(spell)
    end
  end
end
