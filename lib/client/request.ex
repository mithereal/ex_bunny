defmodule Bunny.Net.Client.Request do
  @moduledoc """
  Low level API for building requests. You usually won't need to use this. If you do need to use it, note that you will need to set the `Access_Key` headers yourself.
  """

  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @doc """
  """
  @spec request(Client.t(), atom(), String.t(), binary() | nil, [], []) ::
          {:ok, binary(), term()} | {:error, term()}
  def request(%Client{} = client, method, uri, body \\ nil, headers \\ [], options \\ []) do
    headers =
      case method do
        :upload ->
          [
            access_key(client),
            content_type(client)
            | headers
          ]

        _ ->
          [
            access_key(client)
            | headers
          ]
      end

    with {:ok, resp} <-
           Client.request(client, method, uri, body, headers, options) do
      {:ok, resp.body, resp}
    else
      {:error, %{status: status, body: body} = resp} ->
        {:error, body, resp}

      error = {:error, _reason} ->
        error
    end
  end

  defp access_key(%Client{} = client) do
    {"AccessKey", client.api_key}
  end

  defp content_type(%Client{} = client) do
    {"Content-Type", "application/octet-stream"}
  end
end
