defmodule SpellbookWeb.SpellView do
  use SpellbookWeb, :view
  alias SpellbookWeb.SpellView

  def render("index.json", %{spells: spells}) do
    %{data: render_many(spells, SpellView, "spell.json")}
  end

  def render("show.json", %{spell: spell}) do
    %{data: render_one(spell, SpellView, "spell.json")}
  end

  def render("spell.json", %{spell: spell}) do
    %{
      id: spell.id,
      name: spell.name,
      level: spell.level,
      description: spell.description,
      casting_time: spell.casting_time,
      duration: spell.duration
    }
  end
end
