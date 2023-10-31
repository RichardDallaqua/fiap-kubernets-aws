module "prod" {
  source = "./terraform"

  nome_repositorio = "fiap-lanchonete-service-lanchonete"
  cluster          = "fiap"
}