defmodule StudyWeb.Resolvers.User do
  alias Study.Users

  def create(%{input: params}, _context), do: Users.Create.call(params)
  def get(%{id: user_id}, _context), do: Users.Get.call(user_id)
end
