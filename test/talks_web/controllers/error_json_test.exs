defmodule TalksWeb.ErrorJSONTest do
  use TalksWeb.ConnCase, async: true

  test "renders 404" do
    assert TalksWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert TalksWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
