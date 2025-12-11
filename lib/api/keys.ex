defmodule Bunny.Net.Api.Keys do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The list of all API keys on the account.
  """

  @doc """
  List ApiKeys.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list() do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/apikey", nil, [])
  end
end
