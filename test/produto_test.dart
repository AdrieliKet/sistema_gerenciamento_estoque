import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sistema_gerenciamento_estoque/dao/produto_dao.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';

import 'package:sistema_gerenciamento_estoque/main.dart';

void main() {
  test('Adicionar um novo produto ao estoque.', () {
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoDao.adicionar(produto), "Produto cadastrado com sucesso!");
  });

  test('Remover um produto do estoque.', () {
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto);
    expect(produtoDao.excluir(1), "Produto excluido com sucesso!");
  });
}
