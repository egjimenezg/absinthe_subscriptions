defmodule AbsintheSubscriptionsWeb.Schema do
  use Absinthe.Schema

  alias AbsintheSubscriptionsWeb.Resolvers

  import_types __MODULE__.PlaceTypes

  query do
    field :places, list_of(:place) do
      resolve &Resolvers.Place.get_places/3
    end
  end

  mutation do
    field :create_new_place, :place do
      arg :input, non_null(:place_input)
      resolve &Resolvers.Place.create_place/3
    end
  end

  subscription do
    field :new_place, :place do
      config fn _args, _info ->
        {:ok, topic: "places-topic"}
      end
    end
  end

  scalar :decimal do
    parse fn
      %{value: value}, _ ->
        {decimal_value, ""} = Decimal.parse(value)
        {:ok, decimal_value}
      _, _ ->
        :error
    end

    serialize &to_string/1
  end
end
