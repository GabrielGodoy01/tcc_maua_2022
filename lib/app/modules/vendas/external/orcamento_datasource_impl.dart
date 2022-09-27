import 'package:dio/dio.dart';

import '../infra/datasources/orcamento_datasource_interface.dart';
import '../infra/model/vendas_model.dart';

class OrcamentoDatasourceImpl extends OrcamentoDatasourceInterface {
  final Dio dioClient;

  OrcamentoDatasourceImpl({required this.dioClient});

  List<VendasModel> orcamento = [];

  @override
  Future<List<VendasModel>> getOrcamentos() async {
    return Future.value(orcamento);
  }

  @override
  Future postOrcamento(VendasModel venda) async {
    orcamento.add(venda);
  }
}
