defmodule Bunny.Net.Shield.Logs do
  alias Bunny.Net.Client

  def get(shieldZoneId, date, continuationToken) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/event-logs/#{shieldZoneId}/#{date}/#{continuationToken}",
      nil,
      []
    )
  end
end
