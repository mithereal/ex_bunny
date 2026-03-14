defmodule Bunny.Net.Mc.Applications do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Magic Containers API.
  """

  @doc """
  Returns the list of Applications.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list(limit \\ 20) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/apps?limit=#{limit}", nil, [])
  end

  @doc """
  Returns Application Overview.

  ## Examples

      iex> overview()
      {:ok,[%{}]}

  """
  def overview(appId) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/apps/#{appId}/overview", nil, [])
  end

  @doc """
  Returns Application Information.

  ## Examples

      iex> info()
      {:ok,[%{}]}

  """
  def info(appId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/apps/#{appId}", nil, [])
  end

  @doc """
  Returns Application Statistics.

  ## Examples

      iex> statistics()
      {:ok,[%{}]}

  """
  def statistics(appId) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/apps/#{appId}/statistics", nil, [])
  end

  @doc """
  Deploy Application.

  ## Examples

      iex> deploy()
      {:ok,[%{}]}

  """
  def deploy(appId) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/apps/#{appId}/deploy", nil, [])
  end

  @doc """
  UNDeploy Application.

  ## Examples

      iex> undeploy()
      {:ok,[%{}]}

  """
  def undeploy(appId) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/mc/apps/#{appId}/undeploy", nil, [])
  end

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
  Restart Application.

  ## Examples

      iex> restart()
      {:ok,[%{}]}

  """
  def restart(appId) do
    Client.new!()
    |> Request.request("post", " https://api.bunny.net/mc/apps/#{appId}/restart", nil, [])
  end

  @doc """
  Update Application.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, params) do
    Client.new!()
    |> Request.request(
      "put",
      " https://api.bunny.net/mc/apps/#{appId}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Patch Application.

  ## Examples

      iex> patch()
      {:ok,[%{}]}

  """
  def patch(appId, params) do
    Client.new!()
    |> Request.request(
      "patch",
      " https://api.bunny.net/mc/apps/#{appId}",
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
  def delete(appId) do
    Client.new!()
    |> Request.request("delete", " https://api.bunny.net/mc/apps/#{appId}", nil, [])
  end
end
