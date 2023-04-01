import 'package:sistema_gerenciamento_estoque/entidade/ItemVenda.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

class Venda {
  dynamic id;
  DateTime dataHora;
  Usuario usuario;
  List<ItemVenda> itensVenda;

  Venda(
      {this.id,
      required this.dataHora,
      required this.usuario,
      required this.itensVenda});
}
