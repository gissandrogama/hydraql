defmodule HydraQl.Pickings do
  alias HydraQl.Pickings.Core.SendProductToKafka

  def create_picking(products) do
    SendProductToKafka.execute(products)
  end
end
