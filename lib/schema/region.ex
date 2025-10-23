defmodule Bunny.Net.Schema.Region do
  defstruct(
    :Id,
    :Name,
    :PricePerGigabyte,
    :RegionCode,
    :ContinentCode,
    :CountryCode,
    :Latitude,
    :Longitude,
    :AllowLatencyRouting
  )
end
