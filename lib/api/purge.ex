defmodule Bunny.Net.Api.Purge do
  alias Bunny.Net.Client

  @moduledoc """
  Purge Cache.
  """

  @doc """
  Purge the DnsZones.

  ## Examples

      iex> purge("xxx.com")
      {:ok,%{}}

  """
  def purge(url, async \\ false) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/purge", nil, url: url, async: async)
  end
end
