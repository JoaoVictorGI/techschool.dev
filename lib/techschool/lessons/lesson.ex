defmodule Techschool.Lessons.Lesson do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lessons" do
    field :name, :string
    field :optional, :boolean, default: false
    field :icon_name, :string
    field :description_en, :string
    field :description_pt, :string
    field :language_names, :string, default: ""
    field :framework_names, :string, default: ""
    field :tool_names, :string, default: ""
    field :fundamentals_names, :string, default: ""
    many_to_many :bootcamps, Techschool.Bootcamps.Bootcamp, join_through: "bootcamps_lessons"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lesson, attrs) do
    lesson
    |> cast(attrs, [
      :name,
      :icon_name,
      :optional,
      :description_en,
      :description_pt,
      :language_names,
      :framework_names,
      :tool_names,
      :fundamentals_names
    ])
    |> validate_required([
      :name,
      :icon_name,
      :optional,
      :description_en,
      :description_pt
    ])
    |> unique_constraint(:name)
  end
end
