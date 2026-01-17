defmodule Bunny.Net.Api.DnsZone do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The list of DNS Zones on the account.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  Returns the list of DnsZones.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil) do
    options =
      case search do
        nil -> [page: page, perPage: per_page]
        params -> [page: page, perPage: per_page, search: search]
      end

    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/dnszone",
      nil,
      options
    )
  end

  @doc """
  Add a DnsZone.

  ## Examples

      iex> add("xxx.com")


  """
  def add(domain) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/dnszone", Jason.encode!(domain), [])
  end

  @doc """
  Add a DnsZone.

  ## Examples

      iex> add_record("1111-1111-1111-1111",%{})


  """
  def add_record(zone_id, params) do
    Client.new!()
    |> Request.request(
      "put",
      "https://api.bunny.net/dnszone/zoneId/records",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Update a DnsZone.

  ## Examples

      iex> update("1111-1111-1111-1111",%{})


  """
  def update(id, params) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/dnszone/#{id}", Jason.encode!(params), [])
  end

  @doc """
  Get a DnsZone.

  ## Examples

      iex> update("1111-1111-1111-1111")


  """
  def get(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/dnszone/#{id}", nil, [])
  end

  @doc """
  Check Availability of a DnsZone.

  ## Examples

      iex> check_availability(%{})


  """
  def check_availability(params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/dnszone/checkavailability",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Delete a DnsZone.

  ## Examples

      iex> delete("1111-1111-1111-1111")


  """
  def delete(id) do
    Client.new!()
    |> Request.request("delete", "https://api.bunny.net/dnszone/#{id}", nil, [])
  end

  @doc """
  Enable DnsSec.

  ## Examples

      iex> enable_dnssec("1111-1111-1111-1111")


  """
  def enable_dnssec(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/dnszone/#{id}/dnssec", nil, [])
  end

  @doc """
  Disable DnsSec.

  ## Examples

      iex> disable_dnssec("1111-1111-1111-1111")


  """
  def disable_dnssec(id) do
    Client.new!()
    |> Request.request("delete", "https://api.bunny.net/dnszone/#{id}/dnssec", nil, [])
  end

  @doc """
  Export DnsZone.

  ## Examples

      iex> export("1111-1111-1111-1111")


  """
  def export(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/dnszone/#{id}/export", nil, [])
  end

  @doc """
  DnsZone Statistics.

  ## Examples

      iex> statistics("1111-1111-1111-1111")


  """
  def statistics(id, dateFrom, dateTo) do
    options = [dateFrom: dateFrom, dateTo: dateTo]

    Client.new!()
    |> Request.request("get", "https://api.bunny.net/dnszone/#{id}/statistics", nil, options)
  end
end
