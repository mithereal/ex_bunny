defmodule Bunny.Net.Collections do
  alias Bunny.Net.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

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
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/collections",
      nil,
      options
    )
  end

  def add(libraryId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/collections",
      data,
      []
    )
  end

  def get(libraryId, collectionId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      nil,
      []
    )
  end

  def delete(libraryId, collectionId) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      nil,
      []
    )
  end

  def update(libraryId, collectionId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/collections/#{collectionId}",
      data,
      []
    )
  end
end
