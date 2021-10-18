defmodule HydraQl.Pickings.Core.StorePickingsTest do
  use HydraQl.DataCase

  alias HydraQl.Pickings.Core.StorePickings
  alias HydraQl.Repo
  import Mock

  test "should create pickings" do
    store =
      HydraQl.Repo.insert!(%HydraQl.Stores.Store{
        name: "Swap",
        description: "Swap é a maquina white label de criar fintechs em poucos dias.",
        email: "emailswap@email.com",
        lat: -23.585289979339343,
        lng: -46.67357717366849
      })

    payload = %{
      "products" => [
        %{
          "product" => "multiflex",
          "stores" => [store.id]
        },
        %{
          "product" => "float",
          "stores" => [store.id]
        }
      ]
    }

    with_mock(Mongo,
      insert_one: fn _, _, _ ->
        {:ok, %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123123"}}
      end
    ) do
      assert StorePickings.store_pickings_into_mongo(payload) == [
        %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123123"},
        %Mongo.InsertOneResult{acknowledged: true, inserted_id: "123123"}
      ]
    end
  end
end
