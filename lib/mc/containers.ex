defmodule Bunny.Net.Mc.Containers do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Containers API.
  """

  @doc """
  Add Application.

  ## Examples

      iex> add()
      {:ok,[%{}]}

  """
  def add(params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/apps", Jason.encode!(params), [])
  end

  @doc """
  Get Container.

  ## Examples

      iex> restart()
      {:ok,[%{}]}

  """
  def get(appId, containerId) do
    Client.new!()
    |> Request.request(
      "get",
      " https://api.bunny.net/mc/apps/#{appId}/containers/#{containerId}",
      nil,
      []
    )
  end

  @doc """
  Update Container.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, containerId, params) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/mc/apps/#{appId}/containers/#{containerId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Container.

  ## Examples

      iex> add_template()
      {:ok,[%{}]}

  """
  def add_template(appId, params) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/mc/apps/#{appId}/containers",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Application.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId, containerId) do
    Client.new!()
    |> Request.request(
      "delete",
      " https://api.bunny.net/mc/apps/#{appId}/containers/#{containerId}",
      nil,
      []
    )
  end
end
