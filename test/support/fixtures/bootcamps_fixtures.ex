defmodule Techschool.BootcampsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Techschool.Bootcamps` context.
  """

  @doc """
  Generate a unique bootcamp name.
  """
  def unique_bootcamp_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a bootcamp.
  """
  def bootcamp_fixture(attrs \\ %{}, opts \\ []) do
    {:ok, bootcamp} =
      attrs
      |> Enum.into(%{
        description_en: "some description_en",
        description_pt: "some description_pt",
        icon_name: "some icon_name",
        name: unique_bootcamp_name()
      })
      |> Techschool.Bootcamps.create_bootcamp(opts)

    Techschool.Bootcamps.get_bootcamp!(bootcamp.id)
  end
end
