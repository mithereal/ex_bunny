defmodule Bunny.Net.Shield.Ddos do
  alias Bunny.Net.Client

  def get() do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/ddos/enums",
      nil,
      []
    )
  end
end
