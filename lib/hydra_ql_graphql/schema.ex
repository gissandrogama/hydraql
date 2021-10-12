defmodule HydraQlGraphql.Schema do
  use Absinthe.Schema
  alias HydraQlGraphql.Resolvers

  import_types(HydraQlGraphql.Types)

  query do

  end

  mutation do
    @desc "Create Picking"
    field :create_picking, :string do
      arg(:products, list_of(non_null(:product_input)))
      resolve(&Resolvers.PickingResolver.create_picking/3)
    end
  end
end
