import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';

class ProdutoDao {
  List<Produto> produtosEstoque = [];
  String adicionar(Produto produto) {
    try {
      var existe = false;
      for (var i = 0; i < produtosEstoque.length; i++) {
        var produtoEstoque = produtosEstoque[i];
        if (produtoEstoque.nomeGet == produto.nomeGet) {
          produtoEstoque.quantidadeEstoqueSet = produto.quantidadeEstoqueGet +
              produtoEstoque.quantidadeEstoqueGet;
          existe = true;
          break;
        }
      }
      if (!existe) {
        produtosEstoque.add(produto);
      }
      return "Produto cadastrado com sucesso!";
    } catch (e) {
      throw Exception('Error ao cadastrar produto');
    }
  }

  String alterar(Produto produto) {
    bool produtoEncontrado = false;
    try {
      for (var i = 0; i < produtosEstoque.length; i++) {
        if (produtosEstoque[i].idGet == produto.idGet) {
          produtosEstoque[i] = produto;
          produtoEncontrado = true;
          break;
        }
      }
      if (produtoEncontrado) {
        return "Produto alterado com sucesso!";
      } else {
        return "Produto não encontrado";
      }
    } catch (e) {
      throw Exception('Error ao alterar produto');
    }
  }

  String listarTodos() {
    try {
      if (produtosEstoque.isEmpty)
        return ('Sem registros');
      else
        return produtosEstoque.toString();
    } catch (e) {
      throw Exception('Error ao listar produtos');
    }
  }

  String excluir(int id) {
    Produto? produtoExcluir = getProduto(id);
    try {
      if (produtoExcluir != null) {
        produtosEstoque.remove(produtoExcluir);
        return "Produto excluido com sucesso!";
      } else {
        return "Produto não encontrado";
      }
    } catch (e) {
      throw Exception('Erro ao excluir');
    }
  }

  Produto? getProduto(int id) {
    for (var i = 0; i < produtosEstoque.length; i++) {
      if (produtosEstoque[i].idGet == id) {
        produtosEstoque.remove(produtosEstoque[i]);
        return produtosEstoque[i];
        break;
      }
    }
    return null;
  }

  double valorTotalProdutos() {
    double valor = 0;
    for (var i = 0; i < produtosEstoque.length; i++) {
      valor += produtosEstoque[i].valorProdutoEstoque();
    }
    return valor;
  }

  String? estoqueProdutoBaixo(Produto produto) {
    if (produto.quantidadeEstoqueGet <= produto.quantidadeMinimaGet) {
      return "Estoque menor que o limite minimo permitido!";
    }
    return "Estoque do limite minimo permitido!";
  }

  String? estoqueProdutoAlto(Produto produto) {
    if (produto.quantidadeEstoqueGet >= produto.quantidadeMinimaGet) {
      return "Estoque maior que o limite máximo permitido!";
    }
    return "Estoque menor que o limite máximo permitido!";
  }
}
