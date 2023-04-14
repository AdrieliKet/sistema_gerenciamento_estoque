import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/venda.dart';

class ItemVenda {
  final dynamic _id;
  final Produto _produto;
  final int _quantidadeProduto;

  ItemVenda(
      {dynamic id, required Produto produto, required int quantidadeProduto})
      : _id = id,
        _produto = produto,
        _quantidadeProduto = quantidadeProduto;

  dynamic get id => _id;

  Produto get produto => _produto;

  int get quantidadeProduto => _quantidadeProduto;
}

