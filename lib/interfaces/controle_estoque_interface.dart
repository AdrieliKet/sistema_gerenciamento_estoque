

import '../entidade/produto.dart';

abstract class ControleEstoqueInterface {
  int getTotalEstoque(List<Produto> produtoList);
  bool validateEstoqueAlto(Produto produto);
  bool validateEstoqueBaixo(Produto produto);
  bool validateEstoqueProduto(Produto produto);
}
