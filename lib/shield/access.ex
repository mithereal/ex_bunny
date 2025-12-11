defmodule Bunny.Net.Shield.AccessList do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.AccessList.
  """

  @doc """
  Get AccessList by Zone.

  ## Examples

      iex> get_by_zone("1111-1111-1111-1111")


  """
  def get_by_zone(shieldZoneId) do
    Client.new!()
    |> Request.request(
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


  """
  def get(shieldZoneId, id) do
    Client.new!()
    |> Request.request(
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


  """
  def get_enums(shieldZoneId) do
    Client.new!()
    |> Request.request(
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


  """
  def create_access_list(shieldZoneId, params) do
    Client.new!()
    |> Request.request(
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


  """
  def update_threat_list(shieldZoneId, id, params) do
    Client.new!()
    |> Request.request(
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


  """
  def update(shieldZoneId, id, params) do
    Client.new!()
    |> Request.request(
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


  """
  def delete(shieldZoneId, id) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://api.bunny.net/shield/shield-zone/#{shieldZoneId}/access-lists/#{id}",
      nil,
      []
    )
  end
end
