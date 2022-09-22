import 'package:dio/dio.dart';

import '../infra/datasources/estoque_datasource_interface.dart';
import '../infra/model/estoque_model.dart';

class EstoqueDatasourceImpl extends EstoqueDatasourceInterface {
  final Dio dioClient;

  EstoqueDatasourceImpl({required this.dioClient});

  List<EstoqueModel> estoque = [
    EstoqueModel(
      quantidade: 9,
      descricao: 'Capô Camaro 2014',
      estoqueMinimo: 5,
      estoqueMaximo: 20,
      custo: 6700,
      idEstoque: 0,
      localizacao: 'Ribeirão Preto',
    ),
    EstoqueModel(
      quantidade: 13,
      descricao: 'Porta Saveiro 2013',
      estoqueMinimo: 10,
      estoqueMaximo: 25,
      custo: 1000,
      idEstoque: 1,
      localizacao: 'São Paulo - SP',
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
