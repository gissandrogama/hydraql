# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HydraQl.Repo.insert!(%HydraQl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

HydraQl.Repo.insert!(%HydraQl.Stores.Store{
  name: "Swap",
  description: "Swap é a maquina white label de criar fintechs em poucos dias.",
  email: "emailswap@email.com",
  lat: -23.585289979339343,
  lng: -46.67357717366849
})

HydraQl.Repo.insert!(%HydraQl.Stores.Store{
  name: "Sol Facil",
  description:
    "A Solfácil é uma plataforma tecnológica para financiamento de energia solar feita para você, integrador.",
  email: "emailsolfacil@email.com",
  lat: -23.564952023888395,
  lng: -46.69231000929614
})
