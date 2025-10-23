defmodule Bunny.Net.Api.Region do
  alias Bunny.Net.Client

  def list() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/region", nil, [])
  end
end
