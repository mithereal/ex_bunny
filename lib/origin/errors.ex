defmodule Bunny.Net.Origin.Errors do
  alias Bunny.Net.Client

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
    |> Bunny.Net.request(
      "get",
      "https://cdn-origin-logging.bunny.net/#{pullZoneId}/#{dateTime}",
      nil,
      []
    )
  end
end
