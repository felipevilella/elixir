defmodule Study.Users.Create do
  alias Study.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
