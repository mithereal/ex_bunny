defmodule Bunny.Net.Schema.Statistics.Record do
  defstruct(
    :TotalQueriesServed,
    :QueriesServedChart,
    :NormalQueriesServedChart,
    :SmartQueriesServedChart,
    :QueriesByTypeChart
  )
end
