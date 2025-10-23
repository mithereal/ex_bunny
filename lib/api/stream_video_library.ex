defmodule Bunny.Net.Api.StreamVideoLibrary do
  alias Bunny.Net.Client.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page]

        params ->
          [page: page, perPage: per_page, search: search]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary",
      nil,
      options
    )
  end

  def add(params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/videolibrary", params, [])
  end

  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/videolibrary/#{id}", params, [])
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/#{id}", nil, [])
  end

  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/videolibrary/#{id}", nil, [])
  end

  def storage_zone_availability(name) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/videolibrary/checkavailability", name, [])
  end

  def reset_password(id) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/resetPassword",
      nil,
      []
    )
  end

  def reset_password_readonly(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/resetReadOnlyPassword",
      params,
      []
    )
  end

  def statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = [hourly: hourly]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/#{id}/statistics", nil, [])
  end

  def get_languages() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/languages", nil, [])
  end

  def reset_password(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/languages", nil, id: id)
  end

  def add_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/addAllowedReferrer",
      params,
      []
    )
  end

  def remove_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/removeAllowedReferrer",
      params,
      []
    )
  end

  def add_blocked_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/addBlockedReferrer",
      params,
      []
    )
  end

  def remove_blocked_referrer(id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/videolibrary/#{id}/removeBlockedReferrer",
      nil,
      []
    )
  end

  def add_watermark(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/videolibrary/#{id}/watermark", params, [])
  end

  def remove_watermark(id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/videolibrary/#{id}/removeBlockedReferrer",
      nil,
      []
    )
  end

  def drm_statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = []

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary/#{id}/drm/statistics",
      nil,
      []
    )
  end

  def transcribing_statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = []

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary/#{id}/transcribing/statistics",
      nil,
      []
    )
  end
end
