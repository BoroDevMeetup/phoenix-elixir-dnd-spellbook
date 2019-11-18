defmodule SpellbookWeb.LayoutView do
  use SpellbookWeb, :view

  @suffix "Spellbook"

  def page_title(assigns), do: assigns |> get |> put_suffix

  defp put_suffix(nil), do: @suffix
  defp put_suffix(title), do: title <> " - " <> @suffix

  defp get(%{view_module: SpellbookWeb.SpellView, name: name}), do: name

  defp get(_), do: nil
end
