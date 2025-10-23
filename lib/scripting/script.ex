defmodule Bunny.Net.Scripting.Script do
  alias Bunny.Net.Client

  @moduledoc """
  Scripting.Script.
  """

  @doc """
  Update Script.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/compute/#{id}", Jason.encode!(params), [])
  end

  @doc """
  Get Script.

  ## Examples

      iex> get("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}", nil, [])
  end

  @doc """
  Create Script.

  ## Examples

      iex> create("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def create(id, params) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def delete(id, deleteLinkedPullZones \\ false) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def statistics(id, dateFrom \\ nil, dateTo \\ nil, loadLatest \\ false) do
    options = [hourly: hourly, loadLatest: loadLatest]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}/statistics", nil, [])
  end

  @doc """
  Rotate Deployment Key.

  ## Examples

      iex> rotate_deployment_key("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def rotate_deployment_key(id) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/deploymentKey/rotate",
      nil,
      []
    )
  end
end
