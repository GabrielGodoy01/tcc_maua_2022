import 'package:dio/dio.dart';

import '../infra/datasources/clientes_datasource_interface.dart';
import '../infra/model/clientes_model.dart';

class ClientesDatasourceImpl extends ClientesDatasourceInterface {
  final Dio dioClient;

  ClientesDatasourceImpl({required this.dioClient});

  List<ClientesModel> estoque = [];

  @override
  Future postItem(ClientesModel item) async {
    // dio post implementation
    estoque.add(item);
  }

  @override
  Future putItem(ClientesModel item) async {
    // dio put implementation
    estoque.add(item);
  }
}
