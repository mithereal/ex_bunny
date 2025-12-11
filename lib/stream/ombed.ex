defmodule Bunny.Net.Stream.Ombed do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Stream.Ombed.
  """

  @doc """
  Get Collection.

  ## Examples

      iex> get("xxx.com")


  """
  def get(url \\ nil, maxWidth \\ nil, maxHeight \\ nil, token \\ nil, expires \\ 0) do
    Client.new!()
    |> Request.request(
      "get",
      "https://video.bunnycdn.com/OEmbed",
      nil,
      url: url,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      token: token,
      expires: expires
    )
  end
end
