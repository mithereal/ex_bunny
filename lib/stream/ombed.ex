defmodule Bunny.Net.Collections do
  alias Bunny.Net.Client

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
