use Mix.Config

config :hydra_ql, :mongo_poolboy,
  name: {:local, :worker},
  worker_module: HydraQl.Pickings.Workers.MongoInsertWorker,
  size: 2,
  max_overflow: 2
