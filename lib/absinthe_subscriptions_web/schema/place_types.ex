defmodule AbsintheSubscriptionsWeb.Schema.PlaceTypes do
  use Absinthe.Schema.Notation

  object :place do
    field :latitude, :decimal
    field :longitude, :decimal
  end

end
