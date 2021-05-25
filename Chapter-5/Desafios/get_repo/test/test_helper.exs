ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(GetRepo.Repo, :manual)

Mox.defmock(GetRepo.Client.UserRepoMock, for: GetRepo.Client.Behaviour)
