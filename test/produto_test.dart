import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sistema_gerenciamento_estoque/dao/controle_estoque_dao.dart';
import 'package:sistema_gerenciamento_estoque/dao/produto_dao.dart';
import 'package:sistema_gerenciamento_estoque/dao/venda_dao.dart';
import 'package:sistema_gerenciamento_estoque/entidade/ItemVenda.dart';
import 'package:sistema_gerenciamento_estoque/entidade/gerenciador.dart';
import 'package:sistema_gerenciamento_estoque/entidade/produto.dart';
import 'package:sistema_gerenciamento_estoque/entidade/usuario.dart';
import 'package:sistema_gerenciamento_estoque/entidade/venda.dart';
import 'package:sistema_gerenciamento_estoque/entidade/vendedor.dart';

import 'package:sistema_gerenciamento_estoque/main.dart';

//1 - Só é permitido a venda de produtos que tem estoque. venda
//2 - Todo produto deve possuir um estoque mínimo, no qual, quando chegar neste mínimno o gerente deve ser informado. controle estoque
//3 - Todo produto deve possuir um estoque máximo, no qual, quando chegar neste máximo o gerente deve ser informado. controle estoque
//4 - Somente o gerente pode atualizar o nível mínimo de estoque de um produto. produto
//5 - Somente o gerente pode atualizar o nível máximo de estoque de um produto. produto
//6 - A quantidade de um produto não poderá exceder o nível máximo. produto
//7 - A quantidade total do estoque de um produto deve estar devidamente atualizada e disponível. controle estoque
//8 - Somente o gerente poderá cadastrar um novo produto.    produto
//9 - Somente o gerente poderá remover um novo produto. produto
//10 - Somente o gerente poderá atualizar o preço de um produto. produto

void main() {
  test('Só é permitido a venda de produtos que tem estoque.', () {
    VendaDao vendaDao = VendaDao();
    Vendedor usuario = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    Produto produto1 = Produto(
        nome: "teclado",
        quantidadeEstoque: 100,
        preco: 20.5,
        quantidadeMinima: 50,
        quantidadeMaxima: 150);
    Produto produto2 = Produto(
        nome: "mouse",
        quantidadeEstoque: 100,
        preco: 11.0,
        quantidadeMinima: 50,
        quantidadeMaxima: 150);
    Produto produto3 = Produto(
        nome: "monitor",
        quantidadeEstoque: 20,
        preco: 499.0,
        quantidadeMinima: 30,
        quantidadeMaxima: 50);
    Produto produto4 = Produto(
        nome: "gabinete",
        quantidadeEstoque: 25,
        preco: 300.0,
        quantidadeMinima: 30,
        quantidadeMaxima: 50);
    ItemVenda itemVenda1 = ItemVenda(produto: produto1, quantidadeProduto: 1);
    ItemVenda itemVenda2 = ItemVenda(produto: produto2, quantidadeProduto: 1);
    ItemVenda itemVenda3 = ItemVenda(produto: produto3, quantidadeProduto: 1);
    ItemVenda itemVenda4 = ItemVenda(produto: produto4, quantidadeProduto: 1);
    List<ItemVenda> listaProdutosVenda = [
      itemVenda1,
      itemVenda2,
      itemVenda3,
      itemVenda4
    ];
    expect(vendaDao.cadastrarVenda(listaProdutosVenda, usuario),
        "Não foi possível cadastrar a venda, a quantidade em estoque não é suficiente!");
  });

  test(
      'Todo produto deve possuir um estoque mínimo, no qual, quando chegar neste mínimno o gerente deve ser informado.',
      () {
    ControleEstoqueDao controleEstoqueDao = ControleEstoqueDao();
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 30,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(
        controleEstoqueDao.estoqueProdutoBaixo(
            produto.quantidadeMinima, produto.quantidadeEstoque),
        "Estoque menor que o limite minimo permitido!");
  });

  test(
      'Todo produto deve possuir um estoque máximo, no qual, quando chegar neste máximo o gerente deve ser informado.',
      () {
    ControleEstoqueDao controleEstoqueDao = ControleEstoqueDao();
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 150,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(
        controleEstoqueDao.estoqueProdutoAlto(
            produto.quantidadeMaxima, produto.quantidadeEstoque),
        "Estoque maior que o limite máximo permitido!");
  });

  test(
      'Somente o gerente pode atualizar o nível mínimo de estoque de um produto.',
      () {
    Vendedor vendedor = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto, vendedor);
    expect(produtoDao.alterar(produto, vendedor),
        "Usuário não pode alterar o produto!");
  });

  test(
      'Somente o gerente pode atualizar o nível máximo de estoque de um produto.',
      () {
    Vendedor vendedor = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto, vendedor);
    expect(produtoDao.alterar(produto, vendedor),
        "Usuário não pode alterar o produto!");
  });

  test('A quantidade de um produto não poderá exceder o nível máximo.', () {
    ControleEstoqueDao controleEstoqueDao = ControleEstoqueDao();
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 150,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(
        controleEstoqueDao.estoqueProdutoAlto(
            produto.quantidadeMaxima, produto.quantidadeEstoque),
        "Estoque maior que o limite máximo permitido!");
  });

  test(
      'A quantidade total do estoque de um produto deve estar devidamente atualizada e disponível.',
      () {
    Gerenciador gerenciador = Gerenciador(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    ControleEstoqueDao controleEstoqueDao = ControleEstoqueDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto, gerenciador);
    expect(controleEstoqueDao.quantidadeTotalEstoque(produtoDao.getAll()), 50);
  });

  test('Somente o gerente poderá cadastrar um novo produto.', () {
    Vendedor vendedor = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(produtoDao.adicionar(produto, vendedor),
        "O usuário não pode cadastrar produto.");
  });

  test('Somente o gerente poderá remover um novo produto.', () {
    Vendedor vendedor = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto, vendedor);
    expect(produtoDao.excluir(1, vendedor), "Usuário não pode excluir produto!");
  });

  test('Somente o gerente poderá atualizar o preço de um produto.', () {
    Vendedor vendedor = Vendedor(
        nome: "Adrieli Santos",
        email: "adrieli@gmail.com",
        senha: "1234",
        cpf: "99999999999",
        telefone: "44999999999");
    ProdutoDao produtoDao = ProdutoDao();
    Produto produto = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    produtoDao.adicionar(produto, vendedor);
    expect(produtoDao.alterar(produto, vendedor),
        "Usuário não pode alterar o produto!");
  });
}
