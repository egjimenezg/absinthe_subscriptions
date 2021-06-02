defmodule AbsintheSubscriptionsWeb.Schema.PlaceTypes do
  use Absinthe.Schema.Notation

  object :place do
    field :latitude, :decimal
    field :longitude, :decimal
  end

  input_object :place_input do
    field :latitude, non_null(:decimal)
    field :longitude, non_null(:decimal)
  end

end
