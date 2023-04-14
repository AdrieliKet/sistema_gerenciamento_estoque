import 'dart:ffi';

import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';

class ControleEstoqueDao {
  
  String? estoqueProdutoBaixo(int quantidadeMinima, int quantidadeEstoque) {
    if (limiteMinimoAtingido(quantidadeMinima, quantidadeEstoque)) {
      return "Estoque menor que o limite minimo permitido!";
    }
  }

  String? estoqueProdutoAlto(int quantidadeMaxima, int quantidadeEstoque) {
    if (limiteMaximoAtingido(quantidadeMaxima, quantidadeEstoque)) {
      return "Estoque maior que o limite máximo permitido!";
    }
  }

  bool limiteMinimoAtingido(int quantidadeMinima, int quantidadeEstoque) {
    if (quantidadeEstoque <= quantidadeMinima) {
      return true;
    } else {
      return false;
    }
  }

  bool limiteMaximoAtingido(int quantidadeMaxima, int quantidadeEstoque) {
    if (quantidadeEstoque >= quantidadeMaxima) {
      return true;
    } else {
      return false;
    }
  }

    int quantidadeTotalEstoque(List<Produto> produtos) {
    int quantidadeTotal = 0;
    try {
      produtos.forEach((element) {
        quantidadeTotal += element.quantidadeEstoque;
      });
      return quantidadeTotal;
    } catch (e) {
      throw Exception('Erro ao listar quantiadade total de produtos');
    }
  }
}
