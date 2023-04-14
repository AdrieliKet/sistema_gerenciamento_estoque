class Produto {
  dynamic id;
  String _nome;
  int _quantidadeEstoque;
  double _preco;
  int _quantidadeMinima;
  int _quantidadeMaxima;

  Produto(
      {this.id,
      required String nome,
      required int quantidadeEstoque,
      required double preco,
      required int quantidadeMinima,
      required int quantidadeMaxima})
      : _nome = nome,
        _quantidadeEstoque = quantidadeEstoque,
        _preco = preco,
        _quantidadeMinima = quantidadeMinima,
        _quantidadeMaxima = quantidadeMaxima;

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get quantidadeEstoque => _quantidadeEstoque;

  set quantidadeEstoque(int value) {
    _quantidadeEstoque = value;
  }

  double get preco => _preco;

  set preco(double value) {
    _preco = value;
  }

  int get quantidadeMinima => _quantidadeMinima;

  set quantidadeMinima(int value) {
    _quantidadeMinima = value;
  }

  int get quantidadeMaxima => _quantidadeMaxima;

  set quantidadeMaxima(int value) {
    _quantidadeMaxima = value;
  }

  double valorProdutoEstoque() {
    return quantidadeEstoque * preco;
  }
}

