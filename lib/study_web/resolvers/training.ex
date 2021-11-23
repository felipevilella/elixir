defmodule StudyWeb.Resolvers.Training do
  alias Study.Trainings

  def create(%{input: params}, _context), do: Trainings.Create.call(params)
end
