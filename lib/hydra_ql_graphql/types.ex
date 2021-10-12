defmodule HydraQlGraphql.Types do
  use Absinthe.Schema.Notation
  
  alias HydraQlGraphql.Types

  import_types(Types.ProductType)
end
