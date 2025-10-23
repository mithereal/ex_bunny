defmodule Bunny.Net.Api.User do
  alias Bunny.Net.Client

  def get_user_audit_log(date, request) do
    Client.new!()
    |> Bunny.Net.request("get", "https://api.bunny.net/user/audit/#{date}", nil, request: request)
  end

  def close_account(password, reason) do
    Client.new!()
    |> Bunny.Net.request("post", "https://api.bunny.net/user/closeaccount", nil,
      password: password,
      reason: reason
    )
  end
end
