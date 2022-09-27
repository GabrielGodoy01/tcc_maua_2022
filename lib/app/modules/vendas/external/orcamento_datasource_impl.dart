import 'package:dio/dio.dart';

import '../../clientes/infra/model/clientes_model.dart';
import '../../clientes/infra/model/endereco_model.dart';
import '../../estoque/infra/model/estoque_model.dart';
import '../infra/datasources/orcamento_datasource_interface.dart';
import '../infra/model/estoque_venda_model.dart';
import '../infra/model/vendas_model.dart';

class OrcamentoDatasourceImpl extends OrcamentoDatasourceInterface {
  final Dio dioClient;

  OrcamentoDatasourceImpl({required this.dioClient});

  List<VendasModel> orcamento = [
    VendasModel(
      cliente: ClientesModel(
        idCliente: 0,
        telefones: ['11991273092', '11991273092', '11991273092'],
        nome: 'Hector Ronaldinho',
        razaoSocial: 'razão social',
        cpf: '',
        nomeContato: 'nomeContato',
        rgContato: 'rgContato',
        email: 'email',
        enderecoModel: EnderecoModel(
          bairro: 'SIM',
          cep: '',
          cidade: 'SIM',
        ),
      ),
      listaItensVenda: [
        EstoqueVendaModel(
          quantidade: 10,
          custoFinal: 100,
          estoque: EstoqueModel(
            descricao: 'PRIMEIRA VENDA',
            custo: 10,
            estoqueMaximo: 10,
            estoqueMinimo: 10,
            quantidade: 10,
            idEstoque: 0,
            localizacao: '',
          ),
        ),
        EstoqueVendaModel(
          quantidade: 10,
          custoFinal: 100,
          estoque: EstoqueModel(
            descricao:
                'PRIMEIRA VENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDAVENDA',
            custo: 10,
            estoqueMaximo: 10,
            estoqueMinimo: 10,
            quantidade: 10,
            idEstoque: 0,
            localizacao: '',
          ),
        ),
      ],
      custoFinal: 100.0,
    ),
  ];

  @override
  Future<List<VendasModel>> getOrcamentos() async {
    return Future.value(orcamento);
  }

  @override
  Future postOrcamento(VendasModel venda) async {
    orcamento.add(venda);
  }
}
