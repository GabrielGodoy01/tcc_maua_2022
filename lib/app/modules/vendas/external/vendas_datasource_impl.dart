import 'package:dio/dio.dart';

import '../infra/datasources/vendas_datasource_interface.dart';

class VendasDatasourceImpl extends VendasDatasourceInterface {
  final Dio dioClient;

  VendasDatasourceImpl({required this.dioClient});

  @override
  Future postVenda() {
    // dio post implementation
    throw UnimplementedError();
  }
}
