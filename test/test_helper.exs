ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Spaceex.Repo, :manual)

Mox.defmock(Spaceex.SpaceFlight.ClientMock, for: Spaceex.SpaceFlight.Behaviour)
