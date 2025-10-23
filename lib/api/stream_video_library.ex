defmodule Bunny.Net.Api.StreamVideoLibrary do
  alias Bunny.Net.Client.Client

  @moduledoc """
  StreamVideoLibrary.
  """

  @default_per_page Application.compile_env(:bunny_net, :default_per_page, 1000)

  @doc """
  Returns the list of StreamVideoLibrary's.

  ## Examples

      iex> list()
      {:ok,[%{}]}

  """
  def list(page \\ 1, per_page \\ @default_per_page, search \\ nil) do
    options =
      case search do
        nil ->
          [page: page, perPage: per_page]

        params ->
          [page: page, perPage: per_page, search: search]
      end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary",
      nil,
      options
    )
  end

  @doc """
  Add a StreamVideoLibrary.

  ## Examples

      iex> add(%{})
      {:ok,%{}}

  """
  def add(params) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/videolibrary", Jason.encode!(params), [])
  end

  @doc """
  Update a StreamVideoLibrary.

  ## Examples

      iex> update("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def update(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Get a StreamVideoLibrary.

  ## Examples

      iex> get("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def get(id) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/#{id}", nil, [])
  end

  @doc """
  Delete a StreamVideoLibrary.

  ## Examples

      iex> delete("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def delete(id) do
    Client.new!()
    |> Bunny.Net.request("delete", "https://api.bunny.net/videolibrary/#{id}", nil, [])
  end

  @doc """
  Storage Zone Availability.

  ## Examples

      iex> storage_zone_availability(%{})
      {:ok,%{}}

  """
  def storage_zone_availability(params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/checkavailability",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Reset Password.

  ## Examples

      iex> reset_password("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def reset_password(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/resetPassword",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Reset Password (readonly).

  ## Examples

      iex> reset_password_readonly("1111-1111-1111-1111", %{})
     {:ok,%{}}

  """
  def reset_password_readonly(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/resetReadOnlyPassword",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Statistics.

  ## Examples

      iex> statistics("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = [hourly: hourly]

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/#{id}/statistics", nil, [])
  end

  @doc """
  Langiages.

  ## Examples

      iex> get_languages()
      {:ok,%{}}

  """
  def get_languages() do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/videolibrary/languages", nil, [])
  end

  @doc """
  Add Allowed Referrer.

  ## Examples

      iex> add_allowed_referrer("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """

  def add_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/addAllowedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Allowed Referrer.

  ## Examples

      iex> add_allowed_referrer("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def remove_allowed_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/removeAllowedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Add Blocked Referrer.

  ## Examples

      iex> add_blocked_referrer("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def add_blocked_referrer(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/addBlockedReferrer",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Blocked Referrer.

  ## Examples

      iex> remove_blocked_referrer("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def remove_blocked_referrer(id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/videolibrary/#{id}/removeBlockedReferrer",
      nil,
      []
    )
  end

  @doc """
  Add Watermark.

  ## Examples

      iex> add_watermark("1111-1111-1111-1111", %{})
      {:ok,%{}}

  """
  def add_watermark(id, params) do
    Client.new!()
    |> Bunny.Net.request(
      "post",
      "https://api.bunny.net/videolibrary/#{id}/watermark",
      Jason.encode!(params),
      []
    )
  end

  @doc """
  Remove Watermark.

  ## Examples

      iex> remove_watermark("1111-1111-1111-1111")
     {:ok,%{}}

  """
  def remove_watermark(id) do
    Client.new!()
    |> Bunny.Net.request(
      "delete",
      "https://api.bunny.net/videolibrary/#{id}/removeBlockedReferrer",
      nil,
      []
    )
  end

  @doc """
  Drm Statistics.

  ## Examples

      iex> drm_statistics("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def drm_statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = []

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary/#{id}/drm/statistics",
      nil,
      []
    )
  end

  @doc """
  Transcribing Statistics.

  ## Examples

      iex> transcribing_statistics("1111-1111-1111-1111")
      {:ok,%{}}

  """
  def transcribing_statistics(id, dateFrom \\ nil, dateTo \\ nil) do
    options = []

    unless(is_nil(dateFrom)) do
      options = [dateFrom: dateFrom] ++ options
    end

    unless(is_nil(dateTo)) do
      options = [dateTo: dateTo] ++ options
    end

    Client.new!()
    |> Bunny.Net.request(
      "get",
      "https://api.bunny.net/videolibrary/#{id}/transcribing/statistics",
      nil,
      []
    )
  end
end
