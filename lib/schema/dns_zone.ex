defmodule Bunny.Net.Schema.DnsZone do
  defstruct(
    :Id,
    :Domain,
    :Records
  )
end

defmodule Bunny.Net.Schema.DnsZone.Record do
  defstruct(
    :Id,
    :Type,
    :Ttl,
    :Value,
    :Name,
    :Weight,
    :Priority,
    :Port,
    :Flags,
    :Tag,
    :Accelerated,
    :AcceleratedPullZoneId,
    :LinkName,
    :IPGeoLocationInfo,
    :GeolocationInfo,
    :MonitorStatus,
    :MonitorType,
    :GeolocationLatitude,
    :GeolocationLongitude,
    :EnviromentalVariables,
    :LatencyZone,
    :SmartRoutingType,
    :Disabled,
    :Comment,
    :AutoSslIssuance
  )
end
