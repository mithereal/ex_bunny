defmodule Bunny.Net.Shield.Waf do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Waf.
  """

  @doc """
  Get Waf.

  ## Examples

      iex> get("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def action(shieldZoneId, params) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def recommendation(shieldZoneId, ruleId) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def custom_rules(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def custom_rule(id) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def update_custom_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def update_custom_rule(id, params, :patch) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def delete_custom_rule(id, params) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def profiles() do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def rules(shieldZoneId) do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def rule_segmentation() do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
  def enums() do
    Client.new!()
    |> Bunny.Net.request(
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
      {:ok,%{}}

  """
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
