defmodule HydraQl.Pickings.Workers.CosumeProductsFromKafka do
  use Broadway
  alias Broadway.Message
  alias HydraQl.Pickings

  def start_link(opts) do
    Broadway.start_link(__MODULE__, opts)
  end

  def handle_message(_, message, _) do
    IO.inspect(message.data, label: "Got message")

    message
    |> Message.update_data(&Jason.decode!/1)
    |> Message.put_batcher(:mongo)
  end

  def handle_batch(:mongo, messages, _batch_into, _context) do
    Enum.map(messages, &Pickings.store_pickings_into_mongo(&1.data))
  end
end
