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

  dynamic get idGet => id;
  set idSet(dynamic idSet) => id = idSet;

  String get nomeGet => nome;
  set nomeSet(String nomeSet) => nome = nomeSet;

  int get quantidadeEstoqueGet => quantidadeEstoque;
  set quantidadeEstoqueSet(int quantidadeEstoqueSet) =>
      quantidadeEstoque = quantidadeEstoqueSet;

  double get precoGet => preco;
  set precoSet(double precoSet) => preco = precoSet;

  int get quantidadeMinimaGet => quantidadeMinima;
  set quantidadeMinimaSet(int quantidadeMinimaSet) =>
      quantidadeMinima = quantidadeMinimaSet;

  int get quantidadeMaximaGet => quantidadeMaxima;
  set quantidadeMaximaSet(int quantidadeMaximaSet) =>
      quantidadeMaxima = quantidadeMaximaSet;

  double valorProdutoEstoque() {
    return quantidadeEstoque * preco;
  }
}
