defmodule Bunny.Net.Api.DnsZone do
  alias Bunny.Net.Client.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil) do
    options =
      case search do
        nil -> [page: page, perPage: per_page]
        params -> [page: page, perPage: per_page, search: search]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/dnszone",
      nil,
      options
    )
  end

  def add(domain) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/dnszone", domain, [])
  end

  def add_record(zone_id, params) do
    Client.new!()
    |> Bunny.Net.request("put", "https://api.bunny.net/dnszone/zoneId/records", params, [])
  end

  def update(id, data) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/dnszone/#{id}", data, [])
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/dnszone/#{id}", nil, [])
  end

  def check_availability(id) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/dnszone/checkavailability", id, [])
  end

  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/dnszone/#{id}", nil, [])
  end

  def enable_dnssec(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/dnszone/#{id}/dnssec", nil, [])
  end

  def disable_dnssec(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/dnszone/#{id}/dnssec", nil, [])
  end

  def export(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/dnszone/#{id}/export", nil, [])
  end

  def statistics(id, dateFrom, dateTo) do
    options = [dateFrom: dateFrom, dateTo: dateTo]

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/dnszone/#{id}/statistics", nil, [])
  end
end
