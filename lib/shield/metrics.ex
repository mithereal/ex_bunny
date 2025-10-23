defmodule Bunny.Net.Shield.Metrics do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Metrics.
  """

  @doc """
  Metrics Overview.

  ## Examples

      iex> overview("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def overview(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/overview/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
  Metrics Rate Limits.

  ## Examples

      iex> rate_limits("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def rate_limits(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/rate-limits/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
  Metrics Rate Limit.

  ## Examples

      iex> rate_limit("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def rate_limit(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/rate-limit/#{id}",
      nil,
      []
    )
  end

  @doc """
  Metrics Rule.

  ## Examples

      iex> rule("1111-1111-1111-1111", "1111-1111-1111-1111")
      {:ok,%{}}

  """
  def rule(shieldZoneId, ruleId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/shield-zone/#{shieldZoneId}/waf-rule/#{ruleId}",
      nil,
      []
    )
  end

  @doc """
  Metrics Bot Detection.

  ## Examples

      iex> rule("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def bot_detection(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/shield-zone/#{shieldZoneId}/bot-detection",
      nil,
      []
    )
  end

  @doc """
  Metrics Upload Scanning.

  ## Examples

      iex> upload_scanning("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def upload_scanning(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/shield-zone/#{shieldZoneId}/upload-scanning",
      nil,
      []
    )
  end
end
