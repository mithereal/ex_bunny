defmodule Bunny.Net.Stream.StreamCollections do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Stream.StreamCollections.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  List Collections.

  ## Examples

      iex> list("1111-1111-1111-1111")


  """
  def list(
        libraryId,
        page \\ 1,
        per_page \\ @default_per_page,
        search \\ nil,
        includeThumbnails \\ false,
        orderBy \\ "date"
      ) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, includeThumbnails: includeThumbnails, orderBy: orderBy]

        params ->
          [
            page: page,
            perPage: per_page,
            search: search,
            includeThumbnails: includeThumbnails,
            orderBy: orderBy
          ]
      end

    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/collections",
      nil,
      options
    )
  end

  @doc """
  Add Collections.

  ## Examples

      iex> add("1111-1111-1111-1111", %{})


  """
  def add(libraryId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/collections",
      data,
      []
    )
  end

  @doc """
  Get Collection by Library and Id.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def get(libraryId, collectionId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      nil,
      []
    )
  end

  @doc """
  Delete Collections.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def delete(libraryId, collectionId) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      nil,
      []
    )
  end

  @doc """
  Update Collections.

  ## Examples

      iex> update("1111-1111-1111-1111", "1111-1111-1111-1111", %{})


  """
  def update(libraryId, collectionId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      data,
      []
    )
  end
end
