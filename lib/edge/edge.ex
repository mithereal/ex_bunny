defmodule Bunny.Net.Edge do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  Edge.
  """

  @doc """
  Returns the list of files on Edge.

  ## Examples

      iex> list("name", "/xxx.md")
      [%{}, ...]

  """
  def list(storageZoneName, path) do
    Client.new!()
    |> Request.request(
      "get",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}",
      nil,
      []
    )
  end

  @doc """
  Downloads file from Edge.

  ## Examples

      iex> download("name", "/app/priv", "xxx.md")


  """
  def download(storageZoneName, path, fileName) do
    Client.new!()
    |> Request.request(
      "get",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}/#{fileName}",
      nil,
      []
    )
  end

  @doc """
  Delete file from Edge.

  ## Examples

      iex> delete("name", "/app/priv", "xxx.md")


  """
  def delete(storageZoneName, path, fileName) do
    Client.new!()
    |> Request.request(
      "delete",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}/#{fileName}",
      nil,
      []
    )
  end

  @doc """
  Uploads file to Edge.

  ## Examples

      iex> upload("zone_name", "region_east", "xxx.md", "string")


  """
  def upload(storageZoneName, region, filename, data) do
    fileExt = extension(filename)

    options = [
      form_multipart: [file: {data, filename: filename}]
    ]

    Client.new!()
    |> Request.request(
      "put",
      "https://#{region}.bunnycdn.com/#{storageZoneName}/#{fileExt}",
      nil,
      options
    )
  end

  defp extension(str) do
    str
    |> String.split(".")
    |> List.last()
  end
end
