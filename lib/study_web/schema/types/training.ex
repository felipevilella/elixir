defmodule StudyWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types StudyWeb.Schema.Types.Exercise

  @desc "Logic training representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "user_id"
    field :start_date, non_null(:string),  description: "Start date"
    field :end_date, non_null(:string),  description: "End date"
    field :exercises, list_of(:create_exercise_input),  description: "List exercise"
  end
end
