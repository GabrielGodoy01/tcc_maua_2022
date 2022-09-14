import 'package:dio/dio.dart';

import '../infra/datasources/estoque_datasource_interface.dart';
import '../infra/model/estoque_model.dart';

class EstoqueDatasourceImpl extends EstoqueDatasourceInterface {
  final Dio dioClient;

  EstoqueDatasourceImpl({required this.dioClient});

  List<EstoqueModel> estoque = [];

  @override
  Future postItem(EstoqueModel item) async {
    // dio post implementation
    estoque.add(item);
    // ignore: avoid_print
    print(estoque);
  }
}
