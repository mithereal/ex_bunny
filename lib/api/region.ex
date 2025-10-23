defmodule Bunny.Net.Api.Region do
  alias Bunny.Net.Client

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
    |> Bunny.Net.request("get", "https://api.bunny.net/region", nil, [])
  end
end
