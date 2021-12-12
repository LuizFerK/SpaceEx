defmodule Spaceex.SpaceFlight.ClientTest do
  use ExUnit.Case, async: true

  alias Plug.Conn
  alias Spaceex.Error
  alias Spaceex.SpaceFlight.Client

  describe "get_articles/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "should return the space flight articles", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      body = ~s([
        {
          "id": 0,
          "featured": false,
          "title": "string",
          "url": "string",
          "imageUrl": "string",
          "newsSite": "string",
          "summary": "string",
          "updatedAt": "string",
          "publishedAt": "string",
          "launches": [
            {
              "id": "string",
              "provider": "string"
            }
          ],
          "events": [
            {
              "id": "string",
              "provider": "string"
            }
          ]
        },
        {
          "id": 1,
          "featured": false,
          "title": "string",
          "url": "string",
          "imageUrl": "string",
          "newsSite": "string",
          "summary": "string",
          "updatedAt": "string",
          "publishedAt": "string",
          "launches": [
            {
              "id": "string",
              "provider": "string"
            }
          ],
          "events": [
            {
              "id": "string",
              "provider": "string"
            }
          ]
        }
      ])

      Bypass.expect(bypass, "GET", "articles", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_articles(url, 0)

      assert {:ok, [%{"id" => 0}, %{"id" => 1}]} = response
    end

    test "should return the space flight articles with limit", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      body = ~s([
        {
          "id": 0,
          "featured": false,
          "title": "string",
          "url": "string",
          "imageUrl": "string",
          "newsSite": "string",
          "summary": "string",
          "updatedAt": "string",
          "publishedAt": "string",
          "launches": [
            {
              "id": "string",
              "provider": "string"
            }
          ],
          "events": [
            {
              "id": "string",
              "provider": "string"
            }
          ]
        }
      ])

      Bypass.expect(bypass, "GET", "articles", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_articles(url, 1)

      assert {:ok, [%{"id" => 0}]} = response
    end

    test "when there is a generic error, returns an error", %{bypass: bypass} do
      url = endpoint_url(bypass.port)

      Bypass.down(bypass)

      response = Client.get_articles(url, 0)

      assert {:error, %Error{result: :econnrefused, status: :bad_request}} = response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
