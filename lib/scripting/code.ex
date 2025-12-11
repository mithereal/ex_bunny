defmodule Bunny.Net.Scripting.Code do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Scripting.Code.
  """

  @doc """
  Returns the Code.

  ## Examples

      iex> get("1111-1111-1111-1111")


  """
  def get(id) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/compute/script/#{id}/code", nil, [])
  end

  @doc """
  Sets the Code.

  ## Examples

      iex> set("1111-1111-1111-1111")


  """
  def set(id, params) do
    Client.new!()
    |> Request.request(
      "post",
      "https://api.bunny.net/compute/script/#{id}/code",
      Jason.encode!(params),
      []
    )
  end
end
