defmodule Bunny.Net.Shield.Waf do
  alias Bunny.Net.Client

  def get(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/review-triggered/#{shieldZoneId}",
      nil,
      []
    )
  end

  def action(shieldZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/shield/waf/rules/review-triggered/#{shieldZoneId}",
      params,
      []
    )
  end

  def recommendation(shieldZoneId, ruleId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/review-triggered/ai-recommendation/#{shieldZoneId}/#{ruleId}",
      nil,
      []
    )
  end

  def custom_rules(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/custom-rules/#{shieldZoneId}",
      nil,
      []
    )
  end

  def custom_rule(id) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      nil,
      []
    )
  end

  def update_custom_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "put",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      params,
      []
    )
  end

  def update_custom_rule(id, params, :patch) do
    Client.new!()
    |> Bunny.Net.request(
      "patch",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      params,
      []
    )
  end

  def delete_custom_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      params,
      []
    )
  end

  def profiles() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/profiles",
      nil,
      []
    )
  end

  def rules(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/#{shieldZoneId}",
      nil,
      []
    )
  end

  def rule_segmentation() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/plan-segmentation",
      nil,
      []
    )
  end

  def enums() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/enums",
      nil,
      []
    )
  end

  def configuration() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/waf/engine-config",
      nil,
      []
    )
  end
end
