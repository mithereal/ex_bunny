defmodule Bunny.Net.Api.Countries do
  alias Bunny.Net.Client.Client

  def list() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/country", nil, [])
  end
end
