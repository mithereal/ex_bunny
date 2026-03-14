defmodule Bunny.Net.Mc.Regions do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The User Regions API.
  """

  @doc """
  Returns Region Information.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list(limit \\ 20) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/regions?limit=#{limit}", nil, [])
  end

  @doc """
  Returns Optimal Base Information.

  ## Examples

      iex> optimal()
      {:ok,[%{}]}

  """
  def optimal() do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/mc/regions/optimal", nil, [])
  end
end
