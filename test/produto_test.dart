import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_estoque/entidade/gerenciador.dart';
import 'package:gerenciador_estoque/entidade/usuario.dart';
import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';
import 'package:gerenciador_estoque/interfaces/produto_interface_implements.dart';
import 'package:gerenciador_estoque/service/controle_estoque_service.dart';
import 'package:gerenciador_estoque/entidade/produto.dart';
import 'package:gerenciador_estoque/interfaces/produto_interface.dart';
import 'package:gerenciador_estoque/service/produto_service.dart';

//4 - Somente o gerente pode atualizar o nível mínimo de estoque de um produto. produto
//5 - Somente o gerente pode atualizar o nível máximo de estoque de um produto. produto
//6 - A quantidade de um produto não poderá exceder o nível máximo. produto
//8 - Somente o gerente poderá cadastrar um novo produto.    produto
//9 - Somente o gerente poderá remover um novo produto. produto
//10 - Somente o gerente poderá atualizar o preço de um produto. produto

void main() {
  test(
      'Somente o gerente pode atualizar o nível mínimo de estoque de um produto.',
      () {
    ProdutoService produtoService = ProdutoService();
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    Gerenciador usuario = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoService.alterarProduto(produto, usuario, produtoInterface),
        true);
  });

  test(
      'Somente o gerente pode atualizar o nível máximo de estoque de um produto.',
      () {
    ProdutoService produtoService = ProdutoService();
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoService.alterarProduto(produto, gerenciador, produtoInterface),
        true);
  });

  test('A quantidade de um produto não poderá exceder o nível máximo.', () {
    ProdutoService produtoService = ProdutoService();
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 150,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoService.alterarProduto(produto, gerenciador, produtoInterface),
        false);
  });

  test('Somente o gerente poderá cadastrar um novo produto.', () {
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoService produtoAdicionar = ProdutoService();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    expect(produtoAdicionar.adicionarProduto(produto, gerenciador, produtoInterface),
        true);
  });

  test('Somente o gerente poderá remover um novo produto.', () {
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoService produtoService = ProdutoService();
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoService.removerProduto(produto, gerenciador, produtoInterface),
        true);
  });

  test('Somente o gerente poderá atualizar o preço de um produto.', () {
    ProdutoService produtoService = ProdutoService();
    ProdutoInterface produtoInterface = ProdutoInterfaceImpl();
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoService.alterarProduto(produto, gerenciador, produtoInterface),
        true);
  });
}
