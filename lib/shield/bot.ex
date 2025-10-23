defmodule Bunny.Net.Shield.Bot do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Bot.
  """

  @doc """
  Get Bot.

  ## Examples

      iex> get("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/bot-detection",
      nil,
      []
    )
  end

  @doc """
  Upsert Bot.

  ## Examples

      iex> upsert("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def upsert(shieldZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/bot-detection",
      Jason.encode!(params),
      []
    )
  end
end
