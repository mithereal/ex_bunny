defmodule Bunny.Net.Api.Purge do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Purge Cache.
  """

  @doc """
  Purge the DnsZones.

  ## Examples

      iex> purge("xxx.com")


  """
  def purge(url, async \\ false) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/purge", nil, url: url, async: async)
  end
end
