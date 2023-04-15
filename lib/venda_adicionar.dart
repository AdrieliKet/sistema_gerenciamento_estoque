import 'package:sistema_gerenciamento_estoque/entidade/itemVenda.dart';
import 'package:sistema_gerenciamento_estoque/interfaces/add_produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/gerenciador.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/interfaces/add_venda.dart';

class VendaAdicionar {
  bool adicionarVenda(List<ItemVenda> itemVenda, AddVenda addVenda) {
    return addVenda.addVenda(itemVenda);
  }
}
