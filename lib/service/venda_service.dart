

import '../entidade/itemVenda.dart';
import '../interfaces/venda_interface.dart';

class VendaService {
  bool adicionarVenda(List<ItemVenda> itemVenda, VendaInterface vendaInterface) {
    return vendaInterface.addVenda(itemVenda);
  }
}
