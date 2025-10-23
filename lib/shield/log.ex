defmodule Bunny.Net.Shield.Logs do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Logs.
  """

  @doc """
  Get Logs.

  ## Examples

      iex> get("1111-1111-1111-1111", DateTime.utc_now(), "token")
      {:ok,%{}}

  """
  def get(shieldZoneId, date, continuationToken) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/event-logs/#{shieldZoneId}/#{date}/#{continuationToken}",
      nil,
      []
    )
  end
end
