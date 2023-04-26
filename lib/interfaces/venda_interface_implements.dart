

import 'package:gerenciador_estoque/interfaces/venda_interface.dart';

import '../entidade/itemVenda.dart';

class VendaInterfaceImplements implements VendaInterface {
  @override
  bool addVenda(List<ItemVenda> itemVenda) {
    for (var i = 0; i <= itemVenda.length; i++) {
      if (itemVenda[i].quantidadeProduto <
          itemVenda[i].produto.quantidadeEstoque) {
        return true;
      }
    }
    return false;
  }
}
