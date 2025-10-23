defmodule Bunny.Net.Shield.AccessList do
  alias Bunny.Net.Client

  def get_by_zone(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists",
      nil,
      []
    )
  end

  def get(shieldZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      nil,
      []
    )
  end

  def get_enums(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/enums",
      nil,
      []
    )
  end

  def create_access_list(shieldZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists",
      params,
      []
    )
  end

  def update_threat_list(shieldZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/configurations/#{id}",
      params,
      []
    )
  end

  def update(shieldZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      params,
      []
    )
  end

  def delete(shieldZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      nil,
      []
    )
  end
end
