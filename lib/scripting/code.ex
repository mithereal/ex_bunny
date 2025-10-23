defmodule Bunny.Net.Scripting.Code do
  alias Bunny.Net.Client

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}/code", nil, [])
  end

  def set(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/script/#{id}/code", data, [])
  end
end
