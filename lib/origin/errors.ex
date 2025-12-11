defmodule Bunny.Net.Origin.Errors do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Errors.
  """

  @doc """
  Returns the list of files on Edge.

  ## Examples

      iex> list("name", DateTime.utc_now())
      {:ok,[%{}]}

  """
  def list(pullZoneId, dateTime) do
    Client.new!()
    |> Request.request(
      "get",
      "https://cdn-origin-logging.bunny.net/#{pullZoneId}/#{dateTime}",
      nil,
      []
    )
  end
end
