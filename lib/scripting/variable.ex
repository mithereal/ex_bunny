defmodule Bunny.Net.Scripting.Variable do
  alias Bunny.Net.Client

  @moduledoc """
  Scripting.Variable.
  """

  @doc """
  Update Variable.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Upsert Variable.

  ## Examples

      iex> upsert("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def upsert(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "put",
      "https://api.bunny.net/compute/script/#{id}/variables",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Get Variable.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(id, variableId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/compute/script/#{id}/variables/#{variableId}",
      nil,
      []
    )
  end

  @doc """
  Create Variable.

  ## Examples

      iex> create("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def create(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/variables/add",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Variable.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")
      {:ok,%{}}

  """
  def delete(id, variableId) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/compute/script/#{id}/variables/#{variableId}",
      nil,
      []
    )
  end
end
