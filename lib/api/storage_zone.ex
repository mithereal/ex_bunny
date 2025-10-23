defmodule Bunny.Net.Api.StorageZone do
  alias Bunny.Net.Client.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil, includeDeleted \\ false) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, includeDeleted: includeDeleted]

        params ->
          [page: page, perPage: per_page, search: search, includeDeleted: includeDeleted]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/storagezone",
      nil,
      options
    )
  end

  def add(params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/storagezone", params, [])
  end

  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/storagezone/#{id}", params, [])
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/storagezone/#{id}", nil, [])
  end

  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/storagezone/#{id}", nil, [])
  end

  def storage_zone_availability(name) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/storagezone/checkavailability", name, [])
  end

  def reset_password(id) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/storagezone/#{id}/resetPassword", nil, [])
  end

  def reset_password_readonly(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/storagezone/#{id}/resetReadOnlyPassword",
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
    |> Bunny.Net.request("get", "https://api.bunny.net/storagezone/#{id}/statistics", nil, [])
  end
end
