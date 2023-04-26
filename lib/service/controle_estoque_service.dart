import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';

import '../entidade/produto.dart';

class ControleEstoqueService {

  bool validateProdutoEstoque(
      Produto produto, ControleEstoqueInterface controleEstoqueInterface) {
    return controleEstoqueInterface.validateEstoqueProduto(produto);
  }

  int getTotalEstoque(
      List<Produto> produtoList, ControleEstoqueInterface controleEstoqueInterface) {
    return controleEstoqueInterface.getTotalEstoque(produtoList);
  }
  
  bool validateEstoqueBaixo(Produto produto, ControleEstoqueInterface controleEstoqueInterface) {
    return controleEstoqueInterface.validateEstoqueBaixo(produto);
  }

  bool validateEstoqueAlto(
      Produto produto, ControleEstoqueInterface controleEstoqueInterface) {
    return controleEstoqueInterface.validateEstoqueAlto(produto);
  }
}
