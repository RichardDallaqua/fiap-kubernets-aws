module "prod" {
    source = "../terraform"

    nome_repositorio = "fiap-lanchonete-service-lanchonete"
    cluster_name = "fiap-lanchonete"
}