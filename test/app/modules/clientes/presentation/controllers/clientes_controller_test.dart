import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tcc_maua_2022/app/modules/clientes/domain/repositories/clientes_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/clientes/external/busca_cep_datasource.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/resultado_busca_cep_model.dart';
import 'package:tcc_maua_2022/app/modules/clientes/presentation/controllers/clientes_controller.dart';

import 'clientes_controller_test.mocks.dart';

@GenerateMocks([ClientesRepositoryInterface, BuscaCepDatasource])
void main() {
  late ClientesController controller;
  ClientesRepositoryInterface repository = MockClientesRepositoryInterface();
  BuscaCepDatasource buscaCepDatasource = MockBuscaCepDatasource();
  var cepErrado = '000';
  var cepCerto = '09581570';

  setUpAll(() async {
    when(buscaCepDatasource.getCepExterno(cepErrado))
        .thenAnswer((_) async => ResultadoBuscaCepModel.newInstance());
    when(buscaCepDatasource.getCepExterno(cepCerto))
        .thenAnswer((_) async => ResultadoBuscaCepModel(uf: 'SP'));
    controller = ClientesController(
        buscaCepDatasource: buscaCepDatasource, repository: repository);
  });

  test('procuraCep com CEP escrito errado - Erro', () async {
    await controller.procuraCep(cepErrado);
    expect(controller.endereco.estado, '');
  });

  test('procuraCep com CEP escrito certo - Correto', () async {
    await controller.procuraCep(cepCerto);
    expect(controller.endereco.estado, 'SP');
  });

  test('setNome', () {
    String mock = 'mock';
    controller.setNome(mock);
    expect(controller.cliente.nome, mock);
  });

  test('setRazaoSocial', () {
    String mock = 'mock';
    controller.setRazaoSocial(mock);
    expect(controller.cliente.razaoSocial, mock);
  });

  test('setCpf', () {
    String mock = 'mock';
    controller.setCpf(mock);
    expect(controller.cliente.cpf, mock);
  });

  test('setEmail', () {
    String mock = 'mock';
    controller.setEmail(mock);
    expect(controller.cliente.email, mock);
  });

  test('setTelefone1', () {
    String mock = 'mock';
    controller.setTelefone1(mock);
    expect(controller.cliente.telefones[0], mock);
  });

  test('setTelefone2', () {
    String mock = 'mock';
    controller.setTelefone2(mock);
    expect(controller.cliente.telefones[1], mock);
  });

  test('setTelefone3', () {
    String mock = 'mock';
    controller.setTelefone3(mock);
    expect(controller.cliente.telefones[2], mock);
  });

  test('setNomeContato', () {
    String mock = 'mock';
    controller.setNomeContato(mock);
    expect(controller.cliente.nomeContato, mock);
  });

  test('setRgContato', () {
    String mock = 'mock';
    controller.setRgContato(mock);
    expect(controller.cliente.rgContato, mock);
  });

  test('setCep', () {
    String mock = '000000';
    controller.setCep(mock);
    expect(controller.enderecoCliente.cep, mock);
  });

  test('setNumero', () {
    String mock = '000000';
    controller.setNumero(mock);
    expect(controller.cliente.enderecoModel.numero, mock);
  });

  test('setComplemento', () {
    String mock = '000000';
    controller.setComplemento(mock);
    expect(controller.cliente.enderecoModel.complemento, mock);
  });

  test('limparTexto', () {
    String mock = '000000';
    controller.setComplemento(mock);
    controller.limparTexto();
    expect(controller.cliente.enderecoModel.complemento, '');
  });
}
