defmodule Bunny.Net.Shield.Ddos do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Ddos.
  """

  @doc """
  Get Ddos.

  ## Examples

      iex> get()
      {:ok,%{}}

  """
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
