defmodule Bunny.Net.Mc.Endpoint do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Containers API.
  """

  @doc """
  Get Endpoint.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get(appId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/apps/#{appId}/endpoints", nil, [])
  end

  @doc """
  Get Endpoint.

  ## Examples

      iex> add()
      {:ok,[%{}]}

  """
  def add(appId, containerId, params) do
    Client.new!()
    |> Request.request(
      "post",
      " https://api.bunny.net/mc/apps/#{appId}/containers/#{containerId}/endpoints",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Endpoint.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, containerId, params) do
    Client.new!()
    |> Request.request(
      "put",
      "https://api.bunny.net/mc/apps/#{appId}/endpoints/#{containerId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Endpoint.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId) do
    Client.new!()
    |> Request.request("delete", " https://api.bunny.net/mc/apps/#{appId}/endpoints", nil, [])
  end
end
