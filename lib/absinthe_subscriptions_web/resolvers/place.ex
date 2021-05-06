defmodule AbsintheSubscriptionsWeb.Resolvers.Place do

  alias AbsintheSubscriptions.Place

  def get_places(_, args, _) do
    places = [%Place{latitude: -15.84428, longitude: 17.39953}]
    {:ok, places}
  end

end
