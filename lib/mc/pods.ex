defmodule Bunny.Net.Mc.Pods do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  The User Pods API.
  """

  @doc """
  Returns Node Information.

  ## Examples

      iex> recreate()
      {:ok,[%{}]}

  """
  def recreate(appId, podId) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/mc/apps/#{appId}/pods/#{podId}/recreate",
      nil,
      []
    )
  end
end
