import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_estoque/entidade/itemVenda.dart';
import 'package:gerenciador_estoque/entidade/produto.dart';
import 'package:gerenciador_estoque/interfaces/venda_interface.dart';
import 'package:gerenciador_estoque/interfaces/venda_interface_implements.dart';
import 'package:gerenciador_estoque/service/venda_service.dart';

//1 - Só é permitido a venda de produtos que tem estoque. venda

void main() {
  test('Só é permitido a venda de produtos que tem estoque.', () {
    VendaService vendaService = VendaService();
    VendaInterface vendaInterface = VendaInterfaceImplements();
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
    expect(vendaService.adicionarVenda(listaProdutosVenda, vendaInterface), true);
  });

}

