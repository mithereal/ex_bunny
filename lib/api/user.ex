defmodule Bunny.Net.Api.User do
  alias Bunny.Net.Client.Client
  alias Bunny.Net.Client.Request

  @moduledoc """
  User.
  """

  @doc """
  Get Audit Log.

  ## Examples

      iex> get_user_audit_log(DateTime.utc_now(), %{})


  """
  def get_user_audit_log(date, request) do
    Client.new!()
    |> Request.request("get", "https://api.bunny.net/user/audit/#{date}", nil, request: request)
  end

  @doc """
  Close Account.

  ## Examples

      iex> close_account("password123", "no reason")


  """
  def close_account(password, reason) do
    Client.new!()
    |> Request.request("post", "https://api.bunny.net/user/closeaccount", nil,
      password: password,
      reason: reason
    )
  end
end
