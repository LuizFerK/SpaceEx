defmodule Spaceex.Factory do
  use ExMachina.Ecto, repo: Spaceex.Repo

  alias Spaceex.Article
  alias Spaceex.Articles.Event

  def article_params_factory do
    %{
      "id" => 13_247,
      "featured" => false,
      "title" => "Rocket Report: Astra to launch from Florida, NASA troubleshoots SLS issue",
      "url" =>
        "https://arstechnica.com/science/2021/12/rocket-report-astra-to-launch-from-florida-nasa-troubleshoots-sls-issue/",
      "imageUrl" => "https://cdn.arstechnica.net/wp-content/uploads/2021/12/GwtTgveA.jpeg",
      "newsSite" => "Arstechnica",
      "summary" => "\"Construction of Starship orbital launch pad at the Cape has begun.\"",
      "updatedAt" => "2021-12-11T15:40:12.227Z",
      "publishedAt" => "2021-12-11T15:40:12.000Z",
      "launches" => [
        %{
          "id" => "5896761-b6ca-4df3-9699-e077a360c52a",
          "provider" => "Launch Library 2"
        }
      ],
      "events" => [
        %{
          "id" => "2b74e95d-de9d-44e5-aefb-d1e48d9e35e6",
          "provider" => "Launch Library 2"
        }
      ]
    }
  end

  def article_factory do
    %Article{
      id: 13_247,
      featured: false,
      title: "Blue Origin launches first six-person New Shepard suborbital flight",
      url:
        "https://spacenews.com/blue-origin-launches-first-six-person-new-shepard-suborbital-flight/",
      imageUrl: "https://spacenews.com/wp-content/uploads/2021/12/ns19-descending.jpg",
      newsSite: "SpaceNews",
      summary:
        "Blue Origin launched its third crewed New Shepard suborbital mission Dec. 11, carrying six people on a brief flight to the edge of space.",
      updatedAt: "2021-12-11T15:40:12.227Z",
      publishedAt: "2021-12-11T15:40:12.000Z",
      launches: [
        %Event{
          id: "c9a6a4a2-aee0-4985-8cbe-3d7f4e4161e4",
          provider: "Launch Library 2"
        }
      ],
      events: [
        %Event{
          id: "ba97543d-5960-4618-9539-e883068667a7",
          provider: "Launch Library 2"
        }
      ]
    }
  end
end
