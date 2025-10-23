defmodule Bunny.Net.Api.Statistics do
  alias Bunny.Net.Client

  @moduledoc """
  Statistics.
  """

  @doc """
  Returns the Statistics.

  ## Examples

      iex> get()
      {:ok,%{}}

  """
  def get(
        dateFrom \\ nil,
        dateTo \\ nil,
        pullZone \\ "-1",
        serverZoneId \\ "-1",
        loadErrors \\ false,
        hourly \\ false,
        loadOriginResponseTimes \\ false,
        loadOriginTraffic \\ false,
        loadRequestsServed \\ false,
        loadBandwidthUsed \\ false,
        loadOriginShieldBandwidth \\ false,
        loadGeographicTrafficDistribution \\ false,
        loadUserBalanceHistory \\ false
      ) do
    options = [
      pullZone: pullZone,
      serverZoneId: serverZoneId,
      loadErrors: loadErrors,
      hourly: hourly,
      loadOriginResponseTimes: loadOriginResponseTimes,
      loadOriginTraffic: loadOriginTraffic,
      loadRequestsServed: loadRequestsServed,
      loadBandwidthUsed: loadBandwidthUsed
    ]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/statistics", nil, options)
  end
end
