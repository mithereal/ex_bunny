defmodule Bunny.Net.Api.Keys do
  alias Bunny.Net.Client

  def list() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/apikey", nil, [])
  end
end
