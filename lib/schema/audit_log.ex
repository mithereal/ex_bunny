defmodule Bunny.Net.Schema.User.AuditLog do
  defstruct(
    :Timestamp,
    :Product,
    :ResourceType,
    :ResourceId,
    :ResourceOwner,
    :Action,
    :ActorId,
    :ActorType,
    :Diff
  )
end
