defmodule Bunny.Net.Scripting.Script do
  alias Bunny.Net.Client

  def update(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/#{id}", data, [])
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}", nil, [])
  end

  def create(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/script/#{id}", data, [])
  end

  def delete(id, deleteLinkedPullZones \\ false) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}",
      nil,
      deleteLinkedPullZones: deleteLinkedPullZones
    )
  end

  def statistics(id, dateFrom \\ nil, dateTo \\ nil, loadLatest \\ false) do
    options = [hourly: hourly, loadLatest: loadLatest]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}/statistics", nil, [])
  end

  def rotate_deployment_key(id) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/deploymentKey/rotate",
      nil,
      []
    )
  end
end
