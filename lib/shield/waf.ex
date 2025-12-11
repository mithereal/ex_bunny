defmodule Bunny.Net.Shield.Waf do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Waf.
  """

  @doc """
  Get Waf.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(shieldZoneId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/review-triggered/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
  Waf Action.

  ## Examples

      iex> action("1111-1111-1111-1111", %{})


  """
  def action(shieldZoneId, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/shield/waf/rules/review-triggered/#{shieldZoneId}",
      params,
      []
    )
  end

  @doc """
  Waf Recommendation.

  ## Examples

      iex> recommendation("1111-1111-1111-1111", %{})


  """
  def recommendation(shieldZoneId, ruleId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/review-triggered/ai-recommendation/#{shieldZoneId}/#{ruleId}",
      nil,
      []
    )
  end

  @doc """
  Waf Custom Rules.

  ## Examples

      iex> custom_rules("1111-1111-1111-1111")


  """
  def custom_rules(shieldZoneId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/custom-rules/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
  Waf Custom Rule.

  ## Examples

      iex> custom_rule("1111-1111-1111-1111")


  """
  def custom_rule(id) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      nil,
      []
    )
  end

  @doc """
  Update Waf Custom Rule.

  ## Examples

      iex> update_custom_rule("1111-1111-1111-1111", %{})


  """
  def update_custom_rule(id, params) do
    Client.new!()
    |> Request.request(
      "put",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      params,
      []
    )
  end

  @doc """
  Patch Waf Custom Rule.

  ## Examples

      iex> update_custom_rule("1111-1111-1111-1111", %{}, :patch)


  """
  def update_custom_rule(id, params, :patch) do
    Client.new!()
    |> Request.request(
      "patch",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      params,
      []
    )
  end

  @doc """
  Delete Waf Custom Rule.

  ## Examples

      iex> delete_custom_rule("1111-1111-1111-1111", %{})


  """
  def delete_custom_rule(id, params) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://api.bunny.net/shield/waf/custom-rule/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
   Waf Profiles.

  ## Examples

      iex> profiles()


  """
  def profiles() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/profiles",
      nil,
      []
    )
  end

  @doc """
   Waf Rules.

  ## Examples

      iex> rules("1111-1111-1111-1111")


  """
  def rules(shieldZoneId) do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/#{shieldZoneId}",
      nil,
      []
    )
  end

  @doc """
   Waf Rule Segmentation.

  ## Examples

      iex> rule_segmentation()


  """
  def rule_segmentation() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/rules/plan-segmentation",
      nil,
      []
    )
  end

  @doc """
   Waf Rule Enums.

  ## Examples

      iex> enums()


  """
  def enums() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/enums",
      nil,
      []
    )
  end

  @doc """
   Waf Rule Configuration.

  ## Examples

      iex> configuration()


  """
  def configuration() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/waf/engine-config",
      nil,
      []
    )
  end
end
