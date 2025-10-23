defmodule Bunny.Net.Shield.Zone do
  alias Bunny.Net.Client

  @moduledoc """
  Shield.Zone.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 100)

  @doc """
  List Zones.

  ## Examples

      iex> list()
      {:ok,%{}}

  """
  def list(page \\ 1, per_page \\ @default_per_page) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/shield/shield-zones",
      nil,
      page: page,
      perPage: per_page
    )
  end
end
