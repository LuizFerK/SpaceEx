import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :spaceex, Spaceex.Repo,
  username: "postgres",
  password: "postgres",
  database: "postgres_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :spaceex, Spaceex.Articles.Insert, space_flight_adapter: Spaceex.SpaceFlight.ClientMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :spaceex, SpaceexWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3d5KrMLrbMCeuZVC7cAhDnzTCA2zq3TmdrzD/kPSXIOeRW/u02VcrrctxexBbpgB",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
