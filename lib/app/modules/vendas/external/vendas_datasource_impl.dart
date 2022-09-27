import 'package:dio/dio.dart';
import '../infra/datasources/vendas_datasource_interface.dart';
import '../infra/model/vendas_model.dart';

class VendasDatasourceImpl extends VendasDatasourceInterface {
  final Dio dioClient;

  VendasDatasourceImpl({required this.dioClient});

  List<VendasModel> vendas = [];
  List<VendasModel> orcamento = [];

  @override
  Future postVenda(VendasModel venda) async {
    vendas.add(venda);
  }

  @override
  Future postOrcamento(VendasModel venda) async {
    orcamento.add(venda);
  }
}
