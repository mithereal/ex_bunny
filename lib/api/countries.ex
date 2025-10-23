defmodule Bunny.Net.Api.Countries do
  alias Bunny.Net.Client.Client

  @moduledoc """
  The list of countries and tax rates.
  """

  @doc """
  Returns the list of DnsZones.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/country", nil, [])
  end
end
