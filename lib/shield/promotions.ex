defmodule Bunny.Net.Shield.Promotions do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Shield.Promotions.
  """

  @doc """
  List Promotions.

  ## Examples

      iex> list()


  """
  def list() do
    Client.new!()
    |> Request.request(
      "get",
      "https://api.bunny.net/shield/promo/state",
      nil,
      []
    )
  end
end
