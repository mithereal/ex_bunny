defmodule Bunny.Net.Scripting.Variable do
  alias Bunny.Net.Client

  def update(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/script/#{id}", data, [])
  end

  def upsert(id, data) do
    Client.new!()
    |> Bunny.Net.request("put", "https://api.bunny.net/compute/script/#{id}/variables", data, [])
  end

  def get(id, variableId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/variables/#{variableId}",
      nil,
      []
    )
  end

  def create(id, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/variables/add",
      data,
      []
    )
  end

  def delete(id, variableId) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}/variables/#{variableId}",
      nil,
      []
    )
  end
end
