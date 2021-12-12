defmodule SpaceexWeb.DocSchemas do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  defmodule DocWelcome do
    OpenApiSpex.schema(%{
      title: "Welcome",
      type: :string,
      example: "Back-end Challenge 2021 🏅 - Space Flight News"
    })
  end

  defmodule DocEvent do
    OpenApiSpex.schema(%{
      title: "Event",
      type: :object,
      properties: %{
        id: %Schema{type: :string, description: "Event ID"},
        provider: %Schema{type: :string, description: "Event provider"}
      },
      example: %{
        "id" => "f33d5ece-e825-4cd8-809f-1d4c72a2e0d3",
        "provider" => "Launch Library 2"
      }
    })
  end

  defmodule DocArticle do
    OpenApiSpex.schema(%{
      title: "Article",
      description: "A Space Flight article",
      type: :object,
      properties: %{
        id: %Schema{type: :integer, description: "Article ID"},
        featured: %Schema{type: :boolan, description: "Featured"},
        title: %Schema{type: :string, description: "Article title"},
        url: %Schema{type: :string, description: "Link for article"},
        imageUrl: %Schema{type: :string, description: "Link for article image"},
        newsSite: %Schema{
          type: :string,
          description: "Name of the site where the article come from"
        },
        summary: %Schema{type: :string, description: "Description/Resume"},
        launches: %Schema{type: :array, description: "Article launches", items: DocEvent},
        events: %Schema{type: :array, description: "Article events", items: DocEvent},
        publishedAt: %Schema{
          type: :string,
          description: "Publish timestamp",
          format: :"date-time"
        },
        updatedAt: %Schema{type: :string, description: "Update timestamp", format: :"date-time"}
      },
      required: [
        :id,
        :featured,
        :title,
        :url,
        :imageUrl,
        :newsSite,
        :summary,
        :publishedAt,
        :updatedAt
      ],
      example: %{
        "id" => 13_236,
        "featured" => false,
        "title" => "Roscosmos selects first cosmonaut for commercial crew flights",
        "url" =>
          "https://spacenews.com/roscosmos-selects-first-cosmonaut-for-commercial-crew-flights/",
        "imageUrl" => "https://spacenews.com/wp-content/uploads/2021/12/kikina.jpg",
        "newsSite" => "SpaceNews",
        "summary" =>
          "The head of Roscosmos announced Dec. 8 that the agency has selected the first cosmonaut to go on a SpaceX commercial crew mission to the International Space Station, although a seat barter agreement between NASA and Roscosmos is still being finalized.",
        "updatedAt" => "2021-12-09T18:28:34.284Z",
        "publishedAt" => "2021-12-09T15:57:20.000Z",
        "launches" => [
          %{
            "id" => "f33d5ece-e825-4cd8-809f-1d4c72a2e0d3",
            "provider" => "Launch Library 2"
          }
        ],
        "events" => [
          %{
            "id" => "029615cc-ef67-4a1e-b98e-08bdbfb3ae7e",
            "provider" => "Launch Library 2"
          }
        ]
      }
    })
  end

  defmodule DocArticles do
    OpenApiSpex.schema(%{
      title: "Articles",
      description: "A list of Space Flight articles",
      type: :array,
      items: DocArticle,
      example: [
        %{
          "id" => 13_236,
          "featured" => false,
          "title" => "Roscosmos selects first cosmonaut for commercial crew flights",
          "url" =>
            "https://spacenews.com/roscosmos-selects-first-cosmonaut-for-commercial-crew-flights/",
          "imageUrl" => "https://spacenews.com/wp-content/uploads/2021/12/kikina.jpg",
          "newsSite" => "SpaceNews",
          "summary" =>
            "The head of Roscosmos announced Dec. 8 that the agency has selected the first cosmonaut to go on a SpaceX commercial crew mission to the International Space Station, although a seat barter agreement between NASA and Roscosmos is still being finalized.",
          "updatedAt" => "2021-12-09T18:28:34.284Z",
          "publishedAt" => "2021-12-09T15:57:20.000Z",
          "launches" => [
            %{
              "id" => "f33d5ece-e825-4cd8-809f-1d4c72a2e0d3",
              "provider" => "Launch Library 2"
            }
          ],
          "events" => [
            %{
              "id" => "029615cc-ef67-4a1e-b98e-08bdbfb3ae7e",
              "provider" => "Launch Library 2"
            }
          ]
        },
        %{
          "id" => 13_237,
          "featured" => false,
          "title" => "Team Behind NASA's Newest Mars Rover to Honor Persevering Students",
          "url" => "https://mars.nasa.gov/news/9092/",
          "imageUrl" =>
            "https://mars.nasa.gov/system/news_items/main_images/9092_YouveGotPerseeranceCallToAction-web.jpg",
          "newsSite" => "NASA",
          "summary" =>
            "Middle schoolers who have pushed past obstacles to reach their academic goals will be celebrated by the mission team with a personal message beamed down from NASA’s Perseverance rover.",
          "updatedAt" => "2021-12-09T18:28:27.789Z",
          "publishedAt" => "2021-12-09T18:07:00.000Z",
          "launches" => [],
          "events" => []
        }
      ]
    })
  end

  defmodule DocNoContent do
    OpenApiSpex.schema(%{
      title: "NoContent",
      description: "No content response",
      type: :string,
      example: ""
    })
  end
end
