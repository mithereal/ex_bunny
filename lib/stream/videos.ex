defmodule Bunny.Net.Stream.Videos do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Stream.Videos.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  List Videos.

  ## Examples

      iex> list("1111-1111-1111-1111")


  """
  def list(
        libraryId,
        page \\ 1,
        per_page \\ @default_per_page,
        search \\ nil,
        collection \\ false,
        orderBy \\ "date"
      ) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, collection: collection, orderBy: orderBy]

        params ->
          [
            page: page,
            perPage: per_page,
            search: search,
            collection: collection,
            orderBy: orderBy
          ]
      end

    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos",
      nil,
      options
    )
  end

  @doc """
  Add Videos.

  ## Examples

      iex> add("1111-1111-1111-1111", %{})


  """
  def add(libraryId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos",
      data,
      []
    )
  end

  @doc """
  Get by Library and Id.

  ## Examples

      iex> get("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def get(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      nil,
      []
    )
  end

  def get_play_data(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/play",
      nil,
      []
    )
  end

  def get_video_heatmap(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/play/heatmap",
      nil,
      []
    )
  end

  @doc """
  Delete.

  ## Examples

      iex> delete("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def delete(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      nil,
      []
    )
  end

  @doc """
  Update Video.

  ## Examples

      iex> update("1111-1111-1111-1111", "1111-1111-1111-1111", %{})


  """
  def update(libraryId, videoId, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      data,
      []
    )
  end

  @doc """
  Re-Encode Video.

  ## Examples

      iex> re_encode("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def re_encode(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/reencode",
      nil,
      []
    )
  end

  @doc """
  Re-Package Video.

  ## Examples

      iex> re_package("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def re_package(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/repackage",
      nil,
      []
    )
  end

  @doc """
  Set Video Thumbnail.

  ## Examples

      iex> set_thumbnail("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def set_thumbnail(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/thumbnail",
      nil,
      []
    )
  end

  @doc """
  Set Video Caption.

  ## Examples

      iex> set_caption("1111-1111-1111-1111", "1111-1111-1111-1111", "en", %{})


  """
  def set_caption(libraryId, videoId, srclang, data) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/captions/#{srclang}",
      data,
      []
    )
  end

  @doc """
  Delete Video Caption.

  ## Examples

      iex> delete_caption("1111-1111-1111-1111", "1111-1111-1111-1111", "en")


  """
  def delete_caption(libraryId, videoId, srclang) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/captions/#{srclang}",
      nil,
      []
    )
  end

  @doc """
  Transcribe Video.

  ## Examples

      iex> transcribe("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def transcribe(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/transcribe",
      nil,
      []
    )
  end

  @doc """
  Video Resolutions.

  ## Examples

      iex> resolutions("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def resolutions(libraryId, videoId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/resolutions",
      nil,
      []
    )
  end

  @doc """
  Cleanup Video Resolutions.

  ## Examples

      iex> cleanup_unconfigured_resolutions("1111-1111-1111-1111", "1111-1111-1111-1111")


  """
  def cleanup_unconfigured_resolutions(
        libraryId,
        videoId,
        resolutionsToDelete \\ nil,
        deleteNonConfiguredResolutions \\ false,
        deleteOriginal \\ false,
        deleteMp4Files \\ false,
        dryRun \\ false
      ) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/resolutions/cleanup",
      nil,
      resolutionsToDelete: resolutionsToDelete,
      deleteNonConfiguredResolutions: deleteNonConfiguredResolutions,
      deleteOriginal: deleteOriginal,
      deleteMp4Files: deleteMp4Files,
      dryRun: dryRun
    )
  end

  @doc """
  Video Statistics.

  ## Examples

      iex> statistics("1111-1111-1111-1111")


  """
  def statistics(library_id, dateFrom \\ nil, dateTo \\ nil, hourly \\ false, videoGuid \\ false) do
    options = [hourly: hourly, videoGuid: videoGuid]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/library/#{library_id}/statistics",
      nil,
      []
    )
  end

  @doc """
  Video Smart Actions Trigger.

  ## Examples

      iex> trigger_smart_actions("1111-1111-1111-1111", "1111-1111-1111-1111", %{})


  """
  def trigger_smart_actions(libraryId, videoId, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/smart",
      params,
      []
    )
  end
end
