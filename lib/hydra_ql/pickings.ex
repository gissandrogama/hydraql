defmodule HydraQl.Pickings do
  alias HydraQl.Pickings.Core.SendProductToKafka
  alias HydraQl.Pickings.Core.StorePickings

  def create_picking(products) do
    SendProductToKafka.execute(products)
  end

  def store_pickings_into_mongo(payload) do
    StorePickings.store_pickings_into_mongo(payload)
  end
end
