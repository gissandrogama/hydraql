defmodule HydraQl.Repo do
  use Ecto.Repo,
    otp_app: :hydra_ql,
    adapter: Ecto.Adapters.Postgres
end
