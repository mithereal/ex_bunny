defmodule Bunny.Net.Api.PullZone do
  alias Bunny.Net.Client.Client

  @moduledoc """
  The list of all the pull zones on the account.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  List PullZones.

  ## Examples

      iex> list(1)
      {:ok,[%{}]}

  """
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

  @doc """
  Add a PullZone.

  ## Examples

      iex> add(%{})
      {:ok,%{}}

  """
  def add(params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone", Jason.encode!(params), [])
  end

  @doc """
  Update a PullZone.

  ## Examples

      iex> update("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Get a PullZone.

  ## Examples

      iex> get("1111-1111-1111-1111")
     {:ok,%{}}

  """
  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/pullzone/#{id}", nil, [])
  end

  @doc """
  Delete a PullZone.

  ## Examples

      iex> delete("1111-1111-1111-1111")
     {:ok,%{}}

  """
  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/pullzone/#{id}", nil, [])
  end

  @doc """
  Origin Shield Statistics.

  ## Examples

      iex> origin_shield("1111-1111-1111-1111")
     {:ok,%{}}

  """
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

  @doc """
  Safe Hop Statistics.

  ## Examples

      iex> safe_hop("1111-1111-1111-1111")
     {:ok,%{}}

  """
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

  @doc """
  Optimizer Statistics.

  ## Examples

      iex> optimizer("1111-1111-1111-1111")
     {:ok,%{}}

  """
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

  @doc """
  Load Free Certificate.

  ## Examples

      iex> load_free_certificate("xxx.com")
     {:ok,%{}}

  """
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

  @doc """
  Edge Rule.

  ## Examples

      iex> edge_rule("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def edge_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/edgerules/addOrUpdate",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Enable Edge Rule.

  ## Examples

      iex> enable_edge_rule("1111-1111-1111-1111", "1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def enable_edge_rule(pullZoneId, id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "pullzone/#{pullZoneId}/edgerules/#{id}/setEdgeRuleEnabled",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Purge Cache.

  ## Examples

      iex> purge_cache("1111-1111-1111-1111",  %{})
     {:ok,%{}}

  """
  def purge_cache(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/purgeCache",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Pull Zone Availability.

  ## Examples

      iex> pull_zone_availability(%{})
     {:ok,%{}}

  """
  def pull_zone_availability(params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/checkavailability",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Add Certificate.

  ## Examples

      iex> add_certificate("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def add_certificate(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/purgeCache",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Add Hostname.

  ## Examples

      iex> add_hostname("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def add_hostname(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/addHostname",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Force SSL.

  ## Examples

      iex> force_ssl("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def force_ssl(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/setForceSSL",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Reset Token Key.

  ## Examples

      iex> reset_token_key("1111-1111-1111-1111")
     {:ok,%{}}

  """
  def reset_token_key(id) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/resetSecurityKey", nil, [])
  end

  @doc """
  Add Allowed Referrer.

  ## Examples

      iex> add_allowed_referrer("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def add_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/addAllowedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Allowed Referrer.

  ## Examples

      iex> remove_allowed_referrer("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def remove_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeAllowedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Add Blocked Referrer.

  ## Examples

      iex> add_blocked_referrer("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def add_blocked_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/addBlockedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Blocked Referrer.

  ## Examples

      iex> remove_blocked_referrer("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def remove_blocked_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeBlockedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Add Blocked Ip.

  ## Examples

      iex> add_blocked_ip("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def add_blocked_ip(id, params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/pullzone/#{id}/addBlockedIp", params, [])
  end

  @doc """
  Remove Blocked Ip.

  ## Examples

      iex> remove_blocked_ip("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def remove_blocked_ip(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/pullzone/#{id}/removeBlockedIp",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete Edge Rule.

  ## Examples

      iex> delete_edge_rule("1111-1111-1111-1111","1111-1111-1111-1111")
     {:ok,%{}}

  """
  def delete_edge_rule(pullZoneId, id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/edgerules/#{id}",
      nil,
      []
    )
  end

  @doc """
  Remove Certificate.

  ## Examples

      iex> remove_certificate("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def remove_certificate(pullZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/removeCertificate",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Custom Hostname.

  ## Examples

      iex> remove_custom_hostname("1111-1111-1111-1111",%{})
     {:ok,%{}}

  """
  def remove_custom_hostname(pullZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/pullzone/#{pullZoneId}/removeHostname",
      Jason.encode!(params),
      []
    )
  end
end
