defmodule Bunny.Net.Api.Region do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Region codes.
  """

  @doc """
  Returns the list of Regions.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list() do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/region", nil, [])
  end
end
