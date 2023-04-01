import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/venda.dart';

class ItemVenda {
  dynamic id;
  Produto produto;
  int quantidadeProduto;

  ItemVenda(
      {this.id,
      required this.produto,
      required this.quantidadeProduto});
}
