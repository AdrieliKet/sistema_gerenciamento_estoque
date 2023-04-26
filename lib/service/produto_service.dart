import 'package:gerenciador_estoque/entidade/usuario.dart';
import 'package:gerenciador_estoque/interfaces/produto_interface.dart';
import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';

import '../entidade/produto.dart';

class ProdutoService {
  bool adicionarProduto(
      Produto produto, Usuario usuario, ProdutoInterface produtoInterface) {
    return produtoInterface.addProduto(produto);
  }

  bool alterarProduto(
      Produto produto, Usuario usuario, ProdutoInterface produtoInterface) {
    return produtoInterface.updateProduto(produto);
  }

  bool removerProduto(
      Produto produto, Usuario usuario, ProdutoInterface produtoInterface) {
    return produtoInterface.removeProduto(produto);
  }
}
