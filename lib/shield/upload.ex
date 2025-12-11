defmodule Bunny.Net.Shield.Upload do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Upload.
  """

  @doc """
  Get Upload.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(shieldZoneId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/upload-scanning",
      nil,
      []
    )
  end

  @doc """
  Upsert Upload.

  ## Examples

      iex> upsert("1111-1111-1111-1111", %{})


  """
  def upsert(shieldZoneId, params) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/upload-scanning",
      Jason.encode!(params),
      []
    )
  end
end
