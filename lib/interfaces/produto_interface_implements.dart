import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';
import 'package:gerenciador_estoque/interfaces/controle_estoque_interface_implements.dart';
import 'package:gerenciador_estoque/interfaces/produto_interface.dart';

import '../entidade/produto.dart';

class ProdutoInterfaceImpl implements ProdutoInterface {
  ControleEstoqueInterface controleEstoqueInterface =
      ControleEstoqueInterfaceImpl();
  @override
  bool addProduto(Produto produto) {
    return controleEstoqueInterface.validateEstoqueProduto(produto);
  }

  @override
  bool updateProduto(Produto produto) {
    return controleEstoqueInterface.validateEstoqueProduto(produto);
  }

  @override
  bool removeProduto(Produto produto) {
    return true;
  }
}
