import 'package:sistema_gerenciamento_estoque/interfaces/add_produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/gerenciador.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';

class ProdutoAdicionar {
  bool adicionarProduto(Produto produto, Gerenciador gerenciador, AddProduto addProduto) {
    return addProduto.addProduto(produto);
  }
}
