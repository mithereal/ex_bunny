defmodule Bunny.Net.Api.StorageZone do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  StorageZones.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  Returns the list of StorageZones.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil, includeDeleted \\ false) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, includeDeleted: includeDeleted]

        params ->
          [page: page, perPage: per_page, search: search, includeDeleted: includeDeleted]
      end

    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/storagezone",
      nil,
      options
    )
  end

  @doc """
  Add a StorageZone.

  ## Examples

      iex> add(%{})


  """
  def add(params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/storagezone", params, [])
  end

  @doc """
  Update a StorageZone.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})


  """
  def update(id, params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/storagezone/#{id}", params, [])
  end

  @doc """
  Get a StorageZone.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/storagezone/#{id}", nil, [])
  end

  @doc """
  Delete a StorageZone.

  ## Examples

      iex> delete("1111-1111-1111-1111")


  """
  def delete(id) do
    Client.new!()
    |> Request.request("delete", "https://api.bunny.net/storagezone/#{id}", nil, [])
  end

  @doc """
  StorageZone Availability.

  ## Examples

      iex> storage_zone_availability("zone name")


  """
  def storage_zone_availability(name) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/storagezone/checkavailability", name, [])
  end

  @doc """
  Reset StorageZone Password.

  ## Examples

      iex> reset_password("1111-1111-1111-1111")


  """
  def reset_password(id) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/storagezone/#{id}/resetPassword", nil, [])
  end

  @doc """
  Reset StorageZone Password.

  ## Examples

      iex> reset_password("1111-1111-1111-1111", %{})


  """
  def reset_password_readonly(id, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/storagezone/#{id}/resetReadOnlyPassword",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  StorageZone Statistics.

  ## Examples

      iex> statistics("1111-1111-1111-1111")


  """
  def statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = []

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Request.request("get", "https://api.bunny.net/storagezone/#{id}/statistics", nil, options)
  end
end
