import 'package:sistema_gerenciamento_estoque/interfaces/add_produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/gerenciador.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/interfaces/validate_estoque_alto.dart';
import 'package:sistema_gerenciamento_estoque/interfaces/validate_estoque_baixo.dart';

class ProdutoValidar {
  bool validateEstoqueBaixo(Produto produto, ValidateEstoqueBaixo validateEstoqueBaixo) {
    return validateEstoqueBaixo.validateEstoqueBaixo(produto);
  }

  bool validateEstoqueAlto(
      Produto produto, ValidateEstoqueAlto validateEstoqueAlto) {
    return validateEstoqueAlto.validateEstoqueAlto(produto);
  }
}
