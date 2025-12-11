defmodule Bunny.Net.Shield.Logs do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Logs.
  """

  @doc """
  Get Logs.

  ## Examples

      iex> get("1111-1111-1111-1111", DateTime.utc_now(), "token")


  """
  def get(shieldZoneId, date, continuationToken) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/event-logs/#{shieldZoneId}/#{date}/#{continuationToken}",
      nil,
      []
    )
  end
end
