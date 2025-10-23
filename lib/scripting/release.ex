defmodule Bunny.Net.Scripting.Release do
  alias Bunny.Net.Client

  @moduledoc """
  Scripting.Release.
  """

  @doc """
  Activate the Release.

  ## Examples

      iex> active("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def active(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/releases/active",
      nil,
      []
    )
  end

  @doc """
  Get the Release.

  ## Examples

      iex> get("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/compute/script/#{id}/releases", nil, [])
  end

  @doc """
  Publish the Release.

  ## Examples

      iex> publish("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def publish(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/publish",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Publish the Release.

  ## Examples

      iex> publish("1111-1111-1111-1111", "1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def publish(id, uuid, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/publish/#{uuid}",
      Jason.encode!(params),
      []
    )
  end
end
