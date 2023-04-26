

import '../entidade/produto.dart';

abstract class ProdutoInterface {
  bool addProduto(Produto produto);

  bool updateProduto(Produto produto);

  bool removeProduto(Produto produto);
}
