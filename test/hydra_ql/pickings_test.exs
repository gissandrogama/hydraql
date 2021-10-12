defmodule HydraQl.PickingsTest do
  use HydraQl.DataCase
  alias HydraQl.Pickings
  alias HydraQl.Pickings.Core.SendProductToKafka
  import Mock

  test "should create pickings" do
    products = %{
      products: [
        %{product: "123", stores: ["123", "123123"]},
        %{product: "123", stores: ["123", "123123"]}
      ]
    }

    with_mock(SendProductToKafka,
      execute: fn _products -> {:ok, {:brod_call_ref, 123, 123, "abc"}}  end
    ) do
      assert Pickings.create_picking(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
    end

  end
end
