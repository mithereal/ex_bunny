defmodule Bunny.Net.Scripting.Release do
  alias Bunny.Net.Client

  def active(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/releases/active",
      nil,
      []
    )
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}/releases", nil, [])
  end

  def publish(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/script/#{id}/publish", data, [])
  end

  def publish(id, uuid, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/publish/#{uuid}",
      data,
      []
    )
  end
end
