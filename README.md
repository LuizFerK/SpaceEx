<br />

<p align="center">
  <img alt="Logo" src="./.github/logo.png" width="200px" />
</p>

<h1 align="center" style="text-align: center;">SpaceEx</h1>

<p align="center">
	<a href="https://github.com/LuizFerK">
		<img alt="Author" src="https://img.shields.io/badge/author-Luiz%20Fernando-4E5897?style=flat" />
	</a>
	<a href="#">
		<img alt="Languages" src="https://img.shields.io/github/languages/count/LuizFerK/SpaceEx?color=4E5897&style=flat" />
	</a>
	<a href="hhttps://github.com/LuizFerK/SpaceEx/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/LuizFerK/SpaceEx?color=4E5897&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/SpaceEx/network/members">
		<img alt="Forks" src="https://img.shields.io/github/forks/LuizFerK/SpaceEx?color=4E5897&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/SpaceEx/graphs/contributors">
		<img alt="Contributors" src="https://img.shields.io/github/contributors/LuizFerK/SpaceEx?color=4E5897&style=flat" />
	</a>
</p>

<p align="center">
	<b>Keep your eyes on the sky!</b><br />
	<span>Created with Elixir and Phoenix.</span><br />
	<sub>Made with ❤️</sub>
</p>

<br />

# :pushpin: Contents

- [Features](#rocket-features)
- [Installation](#wrench-installation)
- [Getting started](#bulb-getting-started)
- [Endpoints](#triangular_flag_on_post-endpoints)
- [Techs](#fire-techs)
- [Issues](#bug-issues)
- [License](#book-license)

# :rocket: Features

- Create, delete, get and updates articles
- List articles all articles
- 9AM cronjob to get data from Space Flight API

# :wrench: Installation

### Required :warning:
- Elixir
- Erlang
- Phoenix
- Postgres database

### SSH

SSH URLs provide access to a Git repository via SSH, a secure protocol. If you have an SSH key registered in your GitHub account, clone the project using this command:

```git clone git@github.com:LuizFerK/SpaceEx.git```

### HTTPS

In case you don't have an SSH key on your GitHub account, you can clone the project using the HTTPS URL, run this command:

```git clone https://github.com/LuizFerK/SpaceEx.git```

**Both of these commands will generate a folder called SpaceEx, with all the project**

# :bulb: Getting started

### Development

1. Run ```mix deps.get``` to install the dependencies
2. Create a postgres database named ```spaceex```
3. On the ```config/dev.exs``` and ```config/test.exs``` files, change your postgres **user** and **password**
4. Run ```mix ecto.migrate``` to run the migrations to your database
5. Run ```mix openapi.spec.json --spec SpaceexWeb.ApiSpec``` to create the api docs (OpenAPI 3.0)
6. Run ```mix phx.server``` to start the server on port 4000

### Production

1. Run ```mix deps.get``` to install the dependencies
2. Change de app url on ```config/prod.exs```
3. Run ```mix openapi.spec.json --spec SpaceexWeb.ApiSpec``` on a SSL connection or remote-cli to create the api docs (OpenAPI 3.0) on the production environment
4. Run migrations on your production database with ```mix ecto.migrate``` on a SSL connection or remote-cli
5. Run ```export SECRET_KEY_BASE="$(mix phx.gen.secret)"``` to create a hashed secret key
6. Run ```export DATABASE_URL="<your_database_url>"``` to get the database connection
7. Run ```MIX_ENV=prod mix release``` to create the first release with Releases
8. Run ```MIX_ENV=prod APP_NAME=spaceex PORT=4000 _build/prod/rel/spaceex/bin/spaceex start``` to start the production server

# :triangular_flag_on_post: Endpoints

> If you use Insomnia as your HTTP API requester, you can use the [Insomnia SpaceEx Collection](https://github.com/LuizFerK/SpaceEx/blob/main/.github/insomnia.json) to set up your requests as fast as possible!

> This app is hosted on **Heroku**, if you don't want to set up the project, you can use the already deployed server on `https://apispaceex.herokuapp.com/`.

### Wellcome

* :white_circle: Wellcome - GET `http://localhost:4000/`

	* Response - 200 Ok
	
	`Back-end Challenge 2021 🏅 - Space Flight News`

### Articles

* :green_circle: Create - POST `http://localhost:4000/articles`

	* Request
	
		```json
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
		```
	* Response - 201 Created
	
		```json
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
		```
* :red_circle: Delete - DELETE `http://localhost:4000/articles/:id` Response - 204 No Content

* :purple_circle: Get - GET `http://localhost:4000/articles/:id`

	* Response - 200 Ok
	
		```json
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
		```

* :yellow_circle: Update - PUT `http://localhost:4000/articles/:id`

	* Request:
	
		```json
		{
			"featured": true
		}
		```
	* Response - 200 Ok
	
		```json
		{
			"id": 0,
			"featured": true,
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
		```

* :black_circle: List - GET `http://localhost:4000/articles`

	* Pagination queries:
	
		- **page:** number of the page
	
		- **page_size:** number of articles per page

		> Example: `http://localhost:4000/articles?page=1&page_size=10`

	* Response - 200 Ok
	
		```json
		[
		  	{
				"id": 0,
				"featured": true,
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
		]
		```

### Docs

* :white_circle: Get - GET `http://localhost:4000/docs/json` Response - 200 OpenAPI 3.0 docs (JSON)

* :black_circle: Get - GET `http://localhost:4000/docs` Response - 200 OpenAPI 3.0 docs (Swagger UI)

# :fire: Techs

### Elixir (language)

### Phoenix (web framework)
- Ecto
- Quantum (articles cronjob)
- Tesla (http client to external apis)
- Scrivener Ecto (database pagination)
- Credo (linting)

# :bug: Issues

Find a bug or error on the project? Please, feel free to send me the issue on the [SpaceEx issues area](https://github.com/LuizFerK/SpaceEx/issues), with a title and a description of your found!

If you know the origin of the error and know how to resolve it, please, send me a pull request, I will love to review it!

# :book: License

Released in 2020.

This project is under the [MIT license](https://github.com/LuizFerK/SpaceEx/blob/main/LICENSE).

> This is a challenge by [Coodesh](https://coodesh.com/)

<p align="center">
	< keep coding /> :rocket: :heart:
</p>
