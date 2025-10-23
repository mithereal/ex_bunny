defmodule Bunny.Net.Shield.Bot do
  alias Bunny.Net.Client

  def get(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/bot-detection",
      nil,
      []
    )
  end

  def upsert(shieldZoneId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/bot-detection",
      data,
      []
    )
  end
end
