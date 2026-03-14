defmodule Bunny.Net.Mc.AutoScaling do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The Magic Containers Autoscaling API.
  """

  @doc """
  Returns AutoScaling Information.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get(appId) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/apps/#{appId}/autoscaling", nil, [])
  end

  @doc """
  Update AutoScaling Information.

  ## Examples

      iex> update()
      {:ok,[%{}]}

  """
  def update(appId, params) do
    Client.new!()
    |> Request.request(
      "put",
      " https://api.bunny.net/mc/apps/#{appId}/autoscaling",
      Jason.encode!(params),
      []
    )
  end
end
