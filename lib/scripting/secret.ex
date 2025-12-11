defmodule Bunny.Net.Scripting.Secret do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Scripting.Secret.
  """

  @doc """
  Update Secret.

  ## Examples

      iex> update("1111-1111-1111-1111", "1111-1111-1111-1111", %{})


  """
  def update(id, secretId, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Upsert Secret.

  ## Examples

      iex> upsert("1111-1111-1111-1111", %{})


  """
  def upsert(id, params) do
    Client.new!()
    |> Request.request(
      "put",
      "https://api.bunny.net/compute/script/#{id}/secrets",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Get Secret.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def get(id, secretId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      nil,
      []
    )
  end

  @doc """
  Create Secret.

  ## Examples

      iex> create("1111-1111-1111-1111", %{})


  """

  def create(id, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/secrets/add",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Secret.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def delete(id, secretId, deleteLinkedPullZones \\ false) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}/secrets/#{secretId}",
      nil,
      deleteLinkedPullZones: deleteLinkedPullZones
    )
  end
end
