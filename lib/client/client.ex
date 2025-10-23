defmodule Bunny.Net.Client.Client do
  @moduledoc """
  Used for providing credentials and connection details for interacting with BunnyApi Storage API.

  [BunnyApi Storage Endpoints] https://docs.bunny.net/reference/storage-api

    - Falkenstein, DE: storage.bunnycdn.com
    - London, UK: uk.storage.bunnycdn.com
    - New York, US: ny.storage.bunnycdn.com
    - Los Angeles, US: la.storage.bunnycdn.com
    - Singapore, SG: sg.storage.bunnycdn.com
    - Stockholm, SE: se.storage.bunnycdn.com
    - São Paulo, BR: br.storage.bunnycdn.com
    - Johannesburg, SA: jh.storage.bunnycdn.com

  """
  @doc since: "v0.1.0"

  @bunny_default_endpoint Application.compile_env(
                            :bunny_net,
                            :endpoint,
                            "la.storage.bunnycdn.com"
                          )
  @bunny_storage_zone Application.compile_env(:bunny_net, :storage_zone, "")
  @bunny_storage_api_key Application.compile_env(:bunny_net, :storage_api_key, "")
  @bunny_net_key Application.compile_env(:bunny_net, :api_key, "")

  @type t :: %__MODULE__{
          endpoint: binary() | nil,
          storage_zone: binary() | nil,
          storage_api_key: binary() | nil,
          api_key: binary() | nil,
          http_client: {module(), keyword()}
        }

  defstruct endpoint: nil,
            storage_zone: nil,
            api_key: nil,
            storage_api_key: nil,
            http_client: {Bunny.Net.Adapter.Req, []}

  def new!() do
    case System.get_env(@bunny_default_endpoint) do
      nil -> raise RuntimeError, "missing default endpoint"
      endpoint -> new!(endpoint)
    end
  end

  def new!(endpoint) do
    case {System.get_env(@bunny_storage_zone), System.get_env(@bunny_storage_api_key)} do
      {nil, _} -> raise RuntimeError, "missing storage zone"
      {_, nil} -> raise RuntimeError, "missing api key"
      {storage_zone, storage_api_key} -> new(endpoint, storage_zone, storage_api_key)
    end
  end

  def new(endpoint, storage_zone, storage_api_key) do
    %Bunny.Net.Client{
      endpoint: endpoint,
      storage_zone: storage_zone,
      storage_api_key: storage_api_key
    }
  end

  def put_http_client(%__MODULE__{} = client, http_client) do
    %{client | http_client: http_client}
  end

  def request(client, method, url, body, headers, _opts \\ []) do
    {module, options} = Map.fetch!(client, :http_client)
    apply(module, :request, [method, url, body, headers, options])
  end
end
