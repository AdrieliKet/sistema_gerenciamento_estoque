import 'package:sistema_gerenciamento_estoque/entidade/ItemVenda.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

class Venda {
  dynamic _id;
  DateTime _dataHora;
  Usuario _usuario;
  List<ItemVenda> _itensVenda;

  Venda({
    dynamic id,
    required DateTime dataHora,
    required Usuario usuario,
    required List<ItemVenda> itensVenda,
  })  : _dataHora = dataHora,
        _usuario = usuario,
        _itensVenda = itensVenda;

  dynamic get id => _id;
  set id(dynamic id) => _id = id;

  DateTime get dataHora => _dataHora;
  set dataHora(DateTime dataHora) => _dataHora = dataHora;

  Usuario get usuario => _usuario;
  set usuario(Usuario usuario) => _usuario = usuario;

  List<ItemVenda> get itensVenda => _itensVenda;
  set itensVenda(List<ItemVenda> itensVenda) => _itensVenda = itensVenda;
}

