defmodule Bunny.Net.Shield.AccessList do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.AccessList.
  """

  @doc """
  Get AccessList by Zone.

  ## Examples

      iex> get_by_zone("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get_by_zone(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists",
      nil,
      []
    )
  end

  @doc """
  Get AccessList by Zone and Id.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(shieldZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      nil,
      []
    )
  end

  @doc """
  Get Enums.

  ## Examples

      iex> get_enums("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get_enums(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/enums",
      nil,
      []
    )
  end

  @doc """
  Create Access List.

  ## Examples

      iex> create_access_list("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def create_access_list(shieldZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Threat List.

  ## Examples

      iex> update_threat_list("1111-1111-1111-1111", "1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def update_threat_list(shieldZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/configurations/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update.

  ## Examples

      iex> update("1111-1111-1111-1111", "1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def update(shieldZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")
      {:ok,%{}}

  """
  def delete(shieldZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      nil,
      []
    )
  end
end
