defmodule Bunny.Net.Api.Purge do
  alias Bunny.Net.Client

  def purge(url, async \\ false) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/purge", nil, url: url, async: async)
  end
end
