import 'package:dio/dio.dart';

import '../infra/datasources/estoque_datasource_interface.dart';
import '../infra/model/estoque_model.dart';

class EstoqueDatasourceImpl extends EstoqueDatasourceInterface {
  final Dio dioClient;

  EstoqueDatasourceImpl({required this.dioClient});

  List<EstoqueModel> estoque = [
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
    EstoqueModel(
      quantidade: 10,
      descricao: 'descricao',
      estoqueMinimo: 10,
      estoqueMaximo: 10,
      custo: 100,
      idEstoque: 0,
      localizacao: 'localizacao',
    ),
  ];

  @override
  Future postItem(EstoqueModel item) async {
    // dio post implementation
    estoque.add(item);
  }

  @override
  Future putItem(EstoqueModel item) async {
    // dio put implementation
    estoque.add(item);
  }

  @override
  Future<List<EstoqueModel>> getAllItems() {
    // dio get all implementation
    return Future.value(estoque);
  }
}
