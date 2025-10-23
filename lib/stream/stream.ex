defmodule Bunny.Net.Stream do
  alias Bunny.Net.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 100)

  def list(
        libraryId,
        page \\ 1,
        per_page \\ @default_per_page,
        search \\ nil,
        collectionId \\ nil,
        orderBy \\ "date"
      ) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, collectionId: collectionId, orderBy: orderBy]

        params ->
          [
            page: page,
            perPage: per_page,
            search: search,
            collectionId: collectionId,
            orderBy: orderBy
          ]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live",
      nil,
      options
    )
  end

  def add(libraryId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live",
      data,
      []
    )
  end

  def get(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      nil,
      []
    )
  end

  def get_play_data(libraryId, videoId, token \\ nil, expires \\ 0) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}/play",
      nil,
      token: token,
      expires: expires
    )
  end

  def delete(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      nil,
      []
    )
  end

  def update(libraryId, videoId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      data,
      []
    )
  end

  def set_thumbnail(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}/live/thumbnails",
      nil,
      []
    )
  end

  def get_thumbnail(libraryId, videoId, limit \\ 5, from \\ nil, to \\ nil) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}/thumbnails",
      nil,
      limit: limit,
      from: from,
      to: to
    )
  end

  def start(libraryId, streamId) do
    Client.new!()
    |> Bunny.Net.request(
      "put",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/start",
      nil,
      []
    )
  end

  def stop(libraryId, streamId) do
    Client.new!()
    |> Bunny.Net.request(
      "put",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/stop",
      nil,
      []
    )
  end

  def bitrate_history(libraryId, streamId, startTime \\ nil, endTime \\ nil) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/bitrate-history",
      nil,
      startTime: startTime,
      endTime: endTime
    )
  end

  def current_bitrate(libraryId, streamId, startTime \\ nil, endTime \\ nil) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/current-bitrate",
      nil,
      startTime: startTime,
      endTime: endTime
    )
  end
end
