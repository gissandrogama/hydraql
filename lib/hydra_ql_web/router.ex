defmodule HydraQlWeb.Router do
  use HydraQlWeb, :router

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  # scope "/api", HydraQlWeb do
  #   pipe_through :api
  # end

  scope "/" do
    forward "/graphql", Absinthe.Plug, schema: HydraQlGraphql.Schema, json_code: Jason
  end
end
