defmodule Bunny.Net.Shield.Bot do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Bot.
  """

  @doc """
  Get Bot.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(shieldZoneId) do
    Client.new!()
    |> Request.request(
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


  """
  def upsert(shieldZoneId, params) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/bot-detection",
      Jason.encode!(params),
      []
    )
  end
end
