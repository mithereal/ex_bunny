defmodule Bunny.Net.Stream.Ombed do
  alias Bunny.Net.Client

  @moduledoc """
  Stream.Ombed.
  """

  @doc """
  Get Collection.

  ## Examples

      iex> get("xxx.com")
      {:ok,%{}}

  """
  def get(url \\ nil, maxWidth \\ nil, maxHeight \\ nil, token \\ nil, expires \\ 0) do
    Client.new!()
    |> Bunny.Net.request(
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
