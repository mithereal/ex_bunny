defmodule Bunny.Net.Mc.Nodes do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The User Nodes API.
  """

  @doc """
  Returns Node Information.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get(limit \\ 20) do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/nodes?limit=#{limit}", nil, [])
  end
end
