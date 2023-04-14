import 'dart:ffi';

import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';

import 'controle_estoque_dao.dart';

class ProdutoDao {
  List<Produto> produtosEstoque = [];
  ControleEstoqueDao controleEstoqueDao;

  String adicionar(Produto produto, Usuario usuarioCadastro) {
    try {
      var existe = false;
      controleEstoqueDao.limiteMaximoAtingido(produto.quantidadeMinima, produto.quantidadeEstoque);
      if (usuarioCadastro.tipoUsuario == 'gerenciador') {
        for (var i = 0; i < produtosEstoque.length; i++) {
          var produtoEstoque = produtosEstoque[i];
          if (produtoEstoque.nome == produto.nome) {
            produtoEstoque.quantidadeEstoque =
                produto.quantidadeEstoque + produtoEstoque.quantidadeEstoque;
            produtoEstoque.preco = produto.preco;
            produtoEstoque.quantidadeMaxima = produto.quantidadeMaxima;
            produtoEstoque.quantidadeMinima = produto.quantidadeMinima;
            existe = true;
            break;
          }
        }
        if (!existe) {
          produtosEstoque.add(produto);
        }
        return "Produto cadastrado com sucesso!";
      }
      return "O usuário não pode cadastrar produto.";
    } catch (e) {
      throw Exception('Erro ao cadastrar produto.');
    }
  }

  String alterar(Produto produto, Usuario usuarioAlteracao) {
    bool produtoEncontrado = false;
    try {
      controleEstoqueDao.limiteMaximoAtingido(produto.quantidadeMinima, produto.quantidadeEstoque);
      if (usuarioAlteracao.tipoUsuario == 'gerenciador') {
        for (var i = 0; i < produtosEstoque.length; i++) {
          if (produtosEstoque[i].id == produto.id) {
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
      }
      return "Usuário não pode alterar o produto!";
    } catch (e) {
      throw Exception('Erro ao alterar produto');
    }
  }

  String listarTodos() {
    try {
      if (produtosEstoque.isEmpty)
        return ('Sem registros');
      else
        return produtosEstoque.toString();
    } catch (e) {
      throw Exception('Erro ao listar produtos');
    }
  }

    int quantidadeTotalEstoque() {
      int quantidadeTotal = 0;
    try {
      produtosEstoque.forEach((element) {quantidadeTotal += element.quantidadeEstoque});
      return quantidadeTotal;
    } catch (e) {
      throw Exception('Erro ao listar quantiadade total de produtos');
    }
  }


  String excluir(int id, Usuario usuarioExclusao) {
    Produto? produtoExcluir = getProduto(id);
    try {
      if (usuarioExclusao.tipoUsuario == 'gerenciador') {
        if (produtoExcluir != null) {
          produtosEstoque.remove(produtoExcluir);
          return "Produto excluido com sucesso!";
        } else {
          return "Produto não encontrado";
        }
      }
      return "Usuário não pode excluir produto!";
    } catch (e) {
      throw Exception('Erro ao excluir');
    }
  }

  Produto? getProduto(int id) {
    for (var i = 0; i < produtosEstoque.length; i++) {
      if (produtosEstoque[i].id == id) {
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

  bool temQuantidadeNecessaria(int quantidadeVenda, int quantidadeEstoque) {
    if (quantidadeVenda >= quantidadeEstoque) {
      return true;
    }
    return false;
  }
}
