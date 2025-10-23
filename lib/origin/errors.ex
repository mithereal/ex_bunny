defmodule Bunny.Net.Origin.Errors do
  alias Bunny.Net.Client

  def list(pullZoneId, dateTime) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://cdn-origin-logging.bunny.net/#{pullZoneId}/#{dateTime}",
      nil,
      []
    )
  end
end
