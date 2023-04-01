class Produto {
  dynamic id;
  String nome;
  int quantidadeEstoque;
  double preco;
  int quantidadeMinima;
  int quantidadeMaxima;

  Produto(
      {this.id,
      required this.nome,
      required this.quantidadeEstoque,
      required this.preco,
      required this.quantidadeMinima,
      required this.quantidadeMaxima});

  double valorProdutoEstoque() {
    return quantidadeEstoque * preco;
  }
}
