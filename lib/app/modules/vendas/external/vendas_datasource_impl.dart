import 'package:dio/dio.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';
import 'package:tcc_maua_2022/app/modules/vendas/domain/infra/tipo_pagamento_enum.dart';
import '../../clientes/infra/model/endereco_model.dart';
import '../infra/datasources/vendas_datasource_interface.dart';
import '../infra/model/estoque_venda_model.dart';
import '../infra/model/vendas_model.dart';

class VendasDatasourceImpl extends VendasDatasourceInterface {
  final Dio dioClient;

  VendasDatasourceImpl({required this.dioClient});

  List<VendasModel> vendas = [
    VendasModel(
        tipoPagamento: TipoPagamentoEnum.debito,
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
        custoFinal: 100.0),
    VendasModel(
        custoFinal: 100.0,
        tipoPagamento: TipoPagamentoEnum.debito,
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
          )
        ]),
    VendasModel(
        custoFinal: 100.0,
        tipoPagamento: TipoPagamentoEnum.debito,
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
        ]),
  ];

  @override
  Future postVenda(VendasModel venda) async {
    vendas.add(venda);
  }

  @override
  Future<List<VendasModel>> getVendas() {
    return Future.value(vendas);
  }
}
