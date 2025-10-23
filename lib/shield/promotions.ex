defmodule Bunny.Net.Shield.Promotions do
  alias Bunny.Net.Client

  def list() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/promo/state",
      nil,
      []
    )
  end
end
