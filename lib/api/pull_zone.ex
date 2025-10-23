defmodule Bunny.Net.Api.PullZone do
  alias Bunny.Net.Client.Client

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil, includeCertificate \\ false) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page, includeCertificate: includeCertificate]

        params ->
          [page: page, perPage: per_page, search: search, includeCertificate: includeCertificate]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/pullzone",
      nil,
      options
    )
  end

  def add(params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone", params, [])
  end

  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}", params, [])
  end

  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/pullzone/#{id}", nil, [])
  end

  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/pullzone/#{id}", nil, [])
  end

  def origin_shield(id, dateFrom \\ nil, dateTo \\ nil, hourly \\ false) do
    options = [hourly: hourly]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/pullzone/#{id}/originshield/queuestatistics",
      nil,
      []
    )
  end

  def safe_hop(id, dateFrom \\ nil, dateTo \\ nil, hourly \\ false) do
    options = [hourly: hourly]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/pullzone/#{id}/safehop/statistics",
      nil,
      options
    )
  end

  def optimizer(id, dateFrom \\ nil, dateTo \\ nil, hourly \\ false) do
    options = [hourly: hourly]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/pullzone/#{id}/optimizer/statistics",
      nil,
      options
    )
  end

  def load_free_certificate(hostname) do
    options = [hostname: hostname]

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/pullzone/loadFreeCertificate",
      nil,
      options
    )
  end

  def edge_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/edgerules/addOrUpdate",
      params,
      []
    )
  end

  def enable_edge_rule(pullZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "pullzone/#{pullZoneId}/edgerules/#{id}/setEdgeRuleEnabled",
      params,
      []
    )
  end

  def purge_cache(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/purgeCache", params, [])
  end

  def pull_zone_availability(name) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/checkavailability", name, [])
  end

  def add_certificate(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/purgeCache", params, [])
  end

  def add_hostname(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/addHostname", params, [])
  end

  def force_ssl(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/setForceSSL", params, [])
  end

  def reset_token_key(id) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/resetSecurityKey", nil, [])
  end

  def add_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/addAllowedReferrer",
      params,
      []
    )
  end

  def remove_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeAllowedReferrer",
      params,
      []
    )
  end

  def add_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/addBlockedReferrer",
      params,
      []
    )
  end

  def remove_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeBlockedReferrer",
      params,
      []
    )
  end

  def add_blocked_ip(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/addBlockedIp", params, [])
  end

  def remove_blocked_ip(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeBlockedIp",
      params,
      []
    )
  end

  def delete_edge_rule(pullZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/edgerules/#{id}",
      nil,
      []
    )
  end

  def remove_certificate(pullZoneId, hostname) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/removeCertificate",
      hostname,
      []
    )
  end

  def remove_custom_hostname(pullZoneId, hostname) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/removeHostname",
      hostname,
      []
    )
  end
end
