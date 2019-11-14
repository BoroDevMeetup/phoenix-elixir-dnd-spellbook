defmodule SpellbookWeb.SpellControllerTest do
  use SpellbookWeb.ConnCase

  alias Spellbook.Spells
  alias Spellbook.Spells.Spell

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:spell) do
    {:ok, spell} = Spells.create_spell(@create_attrs)
    spell
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all spells", %{conn: conn} do
      conn = get(conn, Routes.spell_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create spell" do
    test "renders spell when data is valid", %{conn: conn} do
      conn = post(conn, Routes.spell_path(conn, :create), spell: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.spell_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.spell_path(conn, :create), spell: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update spell" do
    setup [:create_spell]

    test "renders spell when data is valid", %{conn: conn, spell: %Spell{id: id} = spell} do
      conn = put(conn, Routes.spell_path(conn, :update, spell), spell: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.spell_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, spell: spell} do
      conn = put(conn, Routes.spell_path(conn, :update, spell), spell: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete spell" do
    setup [:create_spell]

    test "deletes chosen spell", %{conn: conn, spell: spell} do
      conn = delete(conn, Routes.spell_path(conn, :delete, spell))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.spell_path(conn, :show, spell))
      end
    end
  end

  defp create_spell(_) do
    spell = fixture(:spell)
    {:ok, spell: spell}
  end
end
