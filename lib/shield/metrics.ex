defmodule Bunny.Net.Shield.Metrics do
  alias Bunny.Net.Client

  def overview(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/overview/#{shieldZoneId}",
      nil,
      []
    )
  end

  def rate_limits(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/rate-limits/#{shieldZoneId}",
      nil,
      []
    )
  end

  def rate_limit(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/rate-limit/#{id}",
      nil,
      []
    )
  end

  def rule(shieldZoneId, ruleId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/shield-zone/#{shieldZoneId}/waf-rule/#{ruleId}",
      nil,
      []
    )
  end

  def bot_detection(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/metrics/shield-zone/#{shieldZoneId}/bot-detection",
      nil,
      []
    )
  end

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
