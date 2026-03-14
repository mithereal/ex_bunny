defmodule Bunny.Net.Mc.LogForwarding do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The LogForwarding API.
  """

  @doc """
  List Volume Configuration.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list() do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/log/forwarding ", nil, [])
  end

  @doc """
  Add Volume Configuration.

  ## Examples

      iex> add()
      {:ok,[%{}]}

  """
  def add(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/log/forwarding",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Get Volume Configuration.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get(appId) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/log/forwarding/#{appId}", nil, [])
  end

  @doc """
  Update Volume Configuration.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, params) do
    Client.new!()
    |> Request.request(
      "put",
      " https://api.bunny.net/mc/log/forwarding/#{appId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Volume Configuration.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId) do
    Client.new!()
    |> Request.request("delete", "https://api.bunny.net/mc/log/forwarding/#{appId}", nil, [])
  end

  @doc """
  Delete Volume Instances.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId, volumeId) do
    Client.new!()
    |> Request.request(
      "delete",
      " https://api.bunny.net/mc/apps/#{appId}/volumes/#{volumeId}/instances",
      nil,
      []
    )
  end
end
