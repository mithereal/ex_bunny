defmodule Bunny.Net.Scripting.Script do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Scripting.Script.
  """

  @doc """
  Update Script.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})


  """
  def update(id, params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/compute/#{id}", Jason.encode!(params), [])
  end

  @doc """
  Get Script.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/compute/script/#{id}", nil, [])
  end

  @doc """
  Create Script.

  ## Examples

      iex> create("1111-1111-1111-1111", %{})


  """
  def create(id, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete.

  ## Examples

      iex> delete("1111-1111-1111-1111")


  """
  def delete(id, deleteLinkedPullZones \\ false) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}",
      nil,
      deleteLinkedPullZones: deleteLinkedPullZones
    )
  end

  @doc """
  Statistics.

  ## Examples

      iex> statistics("1111-1111-1111-1111")


  """
  def statistics(id, dateFrom \\ nil, dateTo \\ nil, loadLatest \\ false) do
    options = [loadLatest: loadLatest]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Request.request("get", "https://api.bunny.net/compute/script/#{id}/statistics", nil, [])
  end

  @doc """
  Rotate Deployment Key.

  ## Examples

      iex> rotate_deployment_key("1111-1111-1111-1111")


  """
  def rotate_deployment_key(id) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/deploymentKey/rotate",
      nil,
      []
    )
  end
end
