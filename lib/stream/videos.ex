defmodule Bunny.Net.Videos do
  alias Bunny.Net.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

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
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos",
      nil,
      options
    )
  end

  def add(libraryId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos",
      data,
      []
    )
  end

  def get(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      nil,
      []
    )
  end

  def get_play_data(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/play",
      nil,
      []
    )
  end

  def get_video_heatmap(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/play/heatmap",
      nil,
      []
    )
  end

  def delete(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      nil,
      []
    )
  end

  def update(libraryId, videoId, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}",
      data,
      []
    )
  end

  def re_encode(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/reencode",
      nil,
      []
    )
  end

  def re_package(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/repackage",
      nil,
      []
    )
  end

  def set_thumbnail(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/thumbnail",
      nil,
      []
    )
  end

  def set_caption(libraryId, videoId, srclang, data) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/captions/#{srclang}",
      data,
      []
    )
  end

  def delete_caption(libraryId, videoId, srclang) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/captions/#{srclang}",
      nil,
      []
    )
  end

  def transcribe(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/transcribe",
      nil,
      []
    )
  end

  def resolutions(libraryId, videoId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/resolutions",
      nil,
      []
    )
  end

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
    |> Bunny.Net.request(
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

  def statistics(library_id, dateFrom \\ nil, dateTo \\ nil, hourly \\ false, videoGuid \\ false) do
    options = [hourly: hourly, videoGuid: videoGuid]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://video.bunnycdn.com/library/#{library_id}/statistics",
      nil,
      []
    )
  end

  def trigger_smart_actions(libraryId, videoId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://video.bunnycdn.com/library/#{libraryId}/videos/#{videoId}/smart",
      params,
      []
    )
  end
end
