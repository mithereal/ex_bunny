defmodule Bunny.Net.Mc.Limits do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The User Limits API.
  """

  @doc """
  Returns Limit Information.

  ## Examples

      iex> get()
      {:ok,[%{}]}

  """
  def get() do
    Client.new!()
    |> Request.request("get", " https://api.bunny.net/mc/limits", nil, [])
  end
end
