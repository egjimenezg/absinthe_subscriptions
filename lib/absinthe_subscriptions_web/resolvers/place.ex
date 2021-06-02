defmodule AbsintheSubscriptionsWeb.Resolvers.Place do

  alias AbsintheSubscriptions.Place

  def get_places(_, args, _) do
    places = [%Place{latitude: -15.84428, longitude: 17.39953}]
    {:ok, places}
  end

  def create_place(_, %{input: place_input}, _) do
    place = %Place{
      latitude: place_input.latitude,
      longitude: place_input.longitude
    }

    Absinthe.Subscription.publish(
      AbsintheSubscriptionsWeb.Endpoint,
      place,
      new_place: "places-topic"
    )

    {:ok, place}
  end

end
