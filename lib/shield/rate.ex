defmodule Bunny.Net.Shield.RateLimit do
  alias Bunny.Net.Client

  def get_by_zone(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/rate-limits/#{shieldZoneId}",
      nil,
      []
    )
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      nil,
      []
    )
  end

  def create(params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/rate-limit",
      params,
      []
    )
  end

  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      params,
      []
    )
  end

  def delete(id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      nil,
      []
    )
  end
end
