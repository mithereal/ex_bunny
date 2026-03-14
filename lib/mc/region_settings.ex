defmodule Bunny.Net.Mc.RegionSettings do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The User RegionsSettings API.
  """

  @doc """
  Returns Region Settings Information.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def get(appId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/apps/#{appId}/region-settings", nil, [])
  end

  @doc """
  Updates Settings.

  ## Examples

      iex> update(200, %{})
      {:ok,[%{}]}

  """
  def update(appId, params) do
    Client.new!()
    |> Request.request(
      "appId",
      "https://api.bunny.net/mc/apps/#{appId}/region-settings",
      Jason.encode!(params),
      []
    )
  end
end
