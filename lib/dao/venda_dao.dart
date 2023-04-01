import 'package:sistema_gerenciamento_estoque/dao/produto_dao.dart';
import 'package:sistema_gerenciamento_estoque/entidade/ItemVenda.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';
import 'package:sistema_gerenciamento_estoque/entidade/venda.dart';

class VendaDao {
  List<Venda> vendas = [];
  dynamic ids = 0;
  ProdutoDao produtoDao = ProdutoDao();

  String cadastrarVenda(List<ItemVenda> itensVenda, Usuario usuarioVenda) {
    try {
    Venda venda = Venda(
        dataHora: DateTime.now(),
        itensVenda: itensVenda,
        usuario: usuarioVenda,
        id: ids + 1);
    if (podeCadastrarVenda(itensVenda)) {
      vendas.add(venda);
      return "Venda cadastrada com sucesso!";
    } else {
      return "Não foi possível cadastrar a venda, a quantidade em estoque não é suficiente!";
    }
    } catch (e) {
      throw Exception('Erro ao cadastrar venda!');
    }
  }

  bool podeCadastrarVenda(List<ItemVenda> itensVenda) {
    for (var i = 0; i < itensVenda.length; i++) {
      var itemVenda = itensVenda[i];
      if (produtoDao.temQuantidadeNecessaria(
          itemVenda.quantidadeProduto, itemVenda.produto.quantidadeEstoque)) {
        return true;
      }
    }
    return false;
  }
}
