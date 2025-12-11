defmodule Bunny.Net.Shield.Ddos do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Ddos.
  """

  @doc """
  Get Ddos.

  ## Examples

      iex> get()


  """
  def get() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/ddos/enums",
      nil,
      []
    )
  end
end
