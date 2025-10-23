defmodule Bunny.Net.Edge do
  alias Bunny.Net.Client

  def list(storageZoneName, path) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}",
      nil,
      []
    )
  end

  def download(storageZoneName, path, fileName) do
    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}/#{fileName}",
      nil,
      []
    )
  end

  def delete(storageZoneName, path, fileName) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://storage.bunnycdn.com/#{storageZoneName}/#{path}/#{fileName}",
      nil,
      []
    )
  end

  def extension(str) do
    str
    |> String.split(".")
    |> List.last()
  end

  def upload(storageZoneName, region, filename, data) do
    fileExt = extension(filename)

    options = [
      form_multipart: [file: {contents, filename: filename}]
    ]

    Client.new!()
    |> Bunny.Net.request(
      "put",
      "https://#{region}.bunnycdn.com/#{storageZoneName}/#{fileExt}",
      nil,
      options
    )
  end
end
