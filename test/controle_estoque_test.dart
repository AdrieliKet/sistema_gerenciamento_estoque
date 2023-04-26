import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_estoque/entidade/gerenciador.dart';
import 'package:gerenciador_estoque/entidade/produto.dart';
import 'package:gerenciador_estoque/interfaces/controle_estoque_interface.dart';
import 'package:gerenciador_estoque/interfaces/controle_estoque_interface_implements.dart';
import 'package:gerenciador_estoque/service/controle_estoque_service.dart';
import 'package:gerenciador_estoque/service/produto_service.dart';

//2 - Todo produto deve possuir um estoque mínimo, no qual, quando chegar neste mínimno o gerente deve ser informado. controle estoque
//3 - Todo produto deve possuir um estoque máximo, no qual, quando chegar neste máximo o gerente deve ser informado. controle estoque
//7 - A quantidade total do estoque deve estar devidamente atualizada e disponível. controle estoque

void main() {

    test(
      'Todo produto deve possuir um estoque mínimo, no qual, quando chegar neste mínimno o gerente deve ser informado.',
      () {
    ControleEstoqueService controleEstoqueService = ControleEstoqueService();
    ControleEstoqueInterface controleEstoqueInterface = ControleEstoqueInterfaceImpl();
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 30,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(
        controleEstoqueService.validateEstoqueBaixo(
            produto, controleEstoqueInterface),
        true);
  });

  test(
      'Todo produto deve possuir um estoque máximo, no qual, quando chegar neste máximo o gerente deve ser informado.',
      () {
    ControleEstoqueService controleEstoqueService = ControleEstoqueService();
    ControleEstoqueInterface controleEstoqueInterface =
        ControleEstoqueInterfaceImpl();
    Produto produto = Produto(
        id: 1,
        nome: 'mouse',
        quantidadeEstoque: 150,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    expect(
        controleEstoqueService.validateEstoqueAlto(
            produto, controleEstoqueInterface),
        true);
  });

   test(
      'A quantidade total do estoque deve estar devidamente atualizada e disponível.',
      () {
    ControleEstoqueService controleEstoqueService = ControleEstoqueService();
    ControleEstoqueInterface controleEstoqueInterface =
        ControleEstoqueInterfaceImpl();
    Produto produto1 = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    Produto produto2 = Produto(
        id: 1,
        nome: 'detergente',
        quantidadeEstoque: 50,
        preco: 1.89,
        quantidadeMinima: 50,
        quantidadeMaxima: 100);
    List<Produto> produtoList = [produto1, produto2];
    expect(controleEstoqueService.getTotalEstoque(produtoList, controleEstoqueInterface), 100);
  });

}

