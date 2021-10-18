defmodule HydraQl.Pickings.Workers.MongoInsertWorkerTest do
  use ExUnit.Case, async: true
  import Mock

  alias HydraQl.Pickings.Core.StorePickings
  alias HydraQl.Pickings.Workers.MongoInsertWorker

  setup do
    mongo_insert_worker = start_supervised!(MongoInsertWorker)
    %{mongo_insert_worker: mongo_insert_worker}
  end

  test "should test sync call", %{mongo_insert_worker: mongo_insert_worker} do
    payload = %{
      "products" => [
        %{
          "product" => "123",
          "stores" => [
            "2b71af34-59f7-4c20-a858-779787dfb78c",
            "50dc2854-ebcf-4599-9f1a-a508a74183fb"
          ]
        }
      ]
    }

    with_mock(StorePickings,
      store_pickings_into_mongo: fn _ ->
        [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123123"}]
    end) do
      result = GenServer.call(mongo_insert_worker, {:insert_mongo, payload})
      expected = [%Mongo.InsertOneResult{acknowledged: true, inserted_id: "123123"}]
      assert expected = result
    end
  end
end
