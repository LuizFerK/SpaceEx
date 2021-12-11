defmodule Spaceex.WelcomeControllerTest do
  use SpaceexWeb.ConnCase, async: true

  describe "index/2" do
    test "should return the api welcome message", %{conn: conn} do
      response =
        conn
        |> get(Routes.welcome_path(conn, :index))
        |> response(:ok)

      expected_response = "Back-end Challenge 2021 🏅 - Space Flight News"

      assert response == expected_response
    end
  end
end
