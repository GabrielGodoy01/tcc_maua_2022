import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tcc_maua_2022/app/modules/estoque/domain/repositories/estoque_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/controllers/estoque_controller.dart';

import 'estoque_controller_test.mocks.dart';

@GenerateMocks([EstoqueRepositoryInterface])
void main() {
  late EstoqueController controller;
  EstoqueRepositoryInterface repository = MockEstoqueRepositoryInterface();
  var estoqueMock = [
    EstoqueModel(
      quantidade: 10,
      descricao:
          'descricaodescricaodescricaodescricaodescricaodescricaodescricaodescricao',
      estoqueMinimo: 10,
      estoqueMaximo: 10,
      custo: 100,
      idEstoque: 0,
      localizacao: 'localizacao',
    ),
  ];

  setUpAll(() async {
    when(repository.obterTodosEstoques()).thenAnswer((_) async => estoqueMock);
    controller = EstoqueController(repository);
  });

  test('obterTodosEstoque', () {
    controller.obterTodosEstoque();
    expect(controller.listaItensEstoque, estoqueMock);
  });

  test('setDescricao', () {
    String mock = 'mock';
    controller.setDescricao(mock);
    expect(controller.estoque.descricao, mock);
  });

  test('setLocalizacao', () {
    String mock = 'mock';
    controller.setLocalizacao(mock);
    expect(controller.estoque.localizacao, mock);
  });

  test('setQuantidade', () {
    int mock = 111;
    controller.setQuantidade(mock);
    expect(controller.estoque.quantidade, mock);
  });

  test('setEstoqueMinimo', () {
    int mock = 111;
    controller.setEstoqueMinimo(mock);
    expect(controller.estoque.estoqueMinimo, mock);
  });

  test('setEstoqueMaximo', () {
    int mock = 111;
    controller.setEstoqueMaximo(mock);
    expect(controller.estoque.estoqueMaximo, mock);
  });

  test('setCusto', () {
    double mock = 111.0;
    controller.setCusto(mock);
    expect(controller.estoque.custo, mock);
  });

  test('setEstoque', () {
    int mock = 0;
    controller.setEstoque(mock);
    expect(controller.estoque.idEstoque, mock);
  });

  test('limparTexto', () {
    String mock = '000000';
    controller.setDescricao(mock);
    controller.limparTexto();
    expect(controller.estoque.descricao, '');
  });
}
