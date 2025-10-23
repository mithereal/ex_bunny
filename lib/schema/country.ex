defmodule Bunny.Net.Schema.Countries do
  defstruct :items
end

defmodule Bunny.Net.Schema.Country do
  defstruct(
    :Name,
    :IsoCode,
    :IsEU,
    :TaxRate,
    :TaxPrefix,
    :FlagUrl,
    :PopList
  )
end
