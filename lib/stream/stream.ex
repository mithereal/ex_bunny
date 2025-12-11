defmodule Bunny.Net.Stream.Stream do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Stream.Stream.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 100)

  @doc """
  List Streams.

  ## Examples

      iex> list("1111-1111-1111-1111")


  """
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
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live",
      nil,
      options
    )
  end

  @doc """
  Add Stream.

  ## Examples

      iex> add("1111-1111-1111-1111", %{})


  """
  def add(libraryId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live",
      data,
      []
    )
  end

  @doc """
  Get Stream by Library and Id.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def get(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      nil,
      []
    )
  end

  def get_play_data(libraryId, videoId, token \\ nil, expires \\ 0) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}/play",
      nil,
      token: token,
      expires: expires
    )
  end

  @doc """
  Delete Stream.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def delete(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      nil,
      []
    )
  end

  @doc """
  Update Stream.

  ## Examples

      iex> update("1111-1111-1111-1111", "1111-1111-1111-1111", %{})


  """
  def update(libraryId, videoId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}",
      data,
      []
    )
  end

  def set_thumbnail(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{videoId}/live/thumbnails",
      nil,
      []
    )
  end

  def get_thumbnail(libraryId, videoId, limit \\ 5, from \\ nil, to \\ nil) do
    Client.new!()
    |> Request.request(
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
    |> Request.request(
      "put",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/start",
      nil,
      []
    )
  end

  def stop(libraryId, streamId) do
    Client.new!()
    |> Request.request(
      "put",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/stop",
      nil,
      []
    )
  end

  def bitrate_history(libraryId, streamId, startTime \\ nil, endTime \\ nil) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/bitrate-history",
      nil,
      startTime: startTime,
      endTime: endTime
    )
  end

  def current_bitrate(libraryId, streamId, startTime \\ nil, endTime \\ nil) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/live/#{streamId}/current-bitrate",
      nil,
      startTime: startTime,
      endTime: endTime
    )
  end
end
