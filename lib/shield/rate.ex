defmodule Bunny.Net.Shield.RateLimit do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.RateLimit.
  """

  @doc """
  Get by Zone.

  ## Examples

      iex> get_by_zone("1111-1111-1111-1111")


  """
  def get_by_zone(shieldZoneId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/rate-limits/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
  Get Rate.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(id) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      nil,
      []
    )
  end

  @doc """
  Create Rate.

  ## Examples

      iex> create(%{})


  """
  def create(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/shield/rate-limit",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Rate.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})


  """
  def update(id, params) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Rate.

  ## Examples

      iex> delete("1111-1111-1111-1111")


  """
  def delete(id) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://api.bunny.net/shield/rate-limit/#{id}",
      nil,
      []
    )
  end
end
