defmodule Bunny.Net.Mc.Registry do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Registry API.
  """

  @doc """
  Returns the list of Registry's.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list() do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/registries", nil, [])
  end

  @doc """
  Returns Registry Information.

  ## Examples

      iex> info()
      {:ok,[%{}]}

  """
  def get(registryId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/registries/#{registryId}", nil, [])
  end

  @doc """
  Add Registry.

  ## Examples

      iex> add()
      {:ok,[%{}]}

  """
  def add(params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/registries", Jason.encode!(params), [])
  end

  @doc """
  Returns Search.

  ## Examples

      iex> search()
      {:ok,[%{}]}

  """
  def search(params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/registries", Jason.encode!(params), [])
  end

  @doc """
  List Container Images.

  ## Examples

      iex> list_containers()
      {:ok,[%{}]}

  """
  def list_containers(params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/registries", Jason.encode!(params), [])
  end

  @doc """
  List Container Image Tags.

  ## Examples

      iex> list_container_tags()
      {:ok,[%{}]}

  """
  def list_container_tags(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/registries/tags",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  List Container Image Digest.

  ## Examples

      iex> list_container_digest()
      {:ok,[%{}]}

  """
  def list_container_digest(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/registries/digest",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  List Container Config-Suggestions.

  ## Examples

      iex> list_container_config_suggestions()
      {:ok,[%{}]}

  """
  def list_container_config_suggestions(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/registries/config-suggestions",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update Container Registry.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/registries/#{appId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Container Registry.

  ## Examples

      iex> delete()
      {:ok,[%{}]}

  """
  def delete(appId) do
    Client.new!()
    |> Request.request("delete", " https://api.bunny.net/mc/registries/#{appId}", nil, [])
  end
end
