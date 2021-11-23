defmodule Study.Trainings.Create do
  alias Study.{Repo, Training}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
