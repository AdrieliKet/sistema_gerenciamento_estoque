import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';
import 'package:gerenciador_estoque/service/produto_service.dart';

import '../entidade/produto.dart';

class ControleEstoqueInterfaceImpl implements ControleEstoqueInterface {
  ProdutoService produtoService = ProdutoService();
  @override
  bool validateEstoqueProduto(Produto produto) {
    if (produto.quantidadeEstoque > produto.quantidadeMaxima) {
      return false;
    } else if (produto.quantidadeEstoque < produto.quantidadeMinima) {
      return false;
    }
    return true;
  }

  @override
  int getTotalEstoque(List<Produto> produtoList) {
    int total = 0;
    produtoList.forEach((element) {
      total += element.quantidadeEstoque;
    });

    return total;
  }

  @override
  bool validateEstoqueBaixo(Produto produto) {
    if (produto.quantidadeEstoque < produto.quantidadeMinima) {
      return true;
    }

    return false;
  }

  @override
  bool validateEstoqueAlto(Produto produto) {
    if (produto.quantidadeEstoque > produto.quantidadeMinima) {
      return true;
    }

    return false;
  }
}
