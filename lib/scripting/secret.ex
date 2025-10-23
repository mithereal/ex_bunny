defmodule Bunny.Net.Scripting.Secret do
  alias Bunny.Net.Client

  def update(id, secretId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      data,
      []
    )
  end

  def upsert(id, data) do
    Client.new!()
    |> Bunny.Net.request("put", "https://api.bunny.net/compute/script/#{id}/secrets", data, [])
  end

  def get(id, secretId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      nil,
      []
    )
  end

  def create(id, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/secrets/add",
      data,
      []
    )
  end

  def delete(id, secretId, deleteLinkedPullZones \\ false) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      nil,
      deleteLinkedPullZones: deleteLinkedPullZones
    )
  end
end
