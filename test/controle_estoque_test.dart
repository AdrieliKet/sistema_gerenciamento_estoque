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

}
