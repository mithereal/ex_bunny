defmodule Bunny.Net.Schema.DnsSec.Record do
  defstruct(
    :Enabled,
    :DsRecord,
    :Digest,
    :DigestType,
    :Algorithm,
    :PublicKey,
    :KeyTag,
    :Flags,
    :DsConfigured
  )
end
