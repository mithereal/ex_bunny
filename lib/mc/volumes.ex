defmodule Bunny.Net.Mc.Volumes do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Containers API.
  """

  @doc """
  List Volumes.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get(appId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/apps/#{appId}/volumes", nil, [])
  end

  @doc """
  Get Volume.

  ## Examples

      iex> add()
      {:ok,[%{}]}

  """
  def add(appId, volumeId, params) do
    Client.new!()
    |> Request.request(
      "post",
      " https://api.bunny.net/mc/apps/#{appId}/containers/#{volumeId}/volumes",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Volume.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, volumeId, params) do
    Client.new!()
    |> Request.request(
      "put",
      "https://api.bunny.net/mc/apps/#{appId}/volumes/#{volumeId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Detach Volume.

  ## Examples

      iex> detach()
      {:ok,[%{}]}

  """
  def detach(appId, volumeId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/apps/#{appId}/volumes/#{volumeId}/detach",
      nil,
      []
    )
  end

  @doc """
  Delete Volume.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId, volumeId) do
    Client.new!()
    |> Request.request(
      "delete",
      " https://api.bunny.net/mc/apps/#{appId}/volumes/#{volumeId}",
      nil,
      []
    )
  end

  @doc """
  Delete Volume Instances.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete_instances(appId, volumeId) do
    Client.new!()
    |> Request.request(
      "delete",
      " https://api.bunny.net/mc/apps/#{appId}/volumes/#{volumeId}/instances",
      nil,
      []
    )
  end
end
