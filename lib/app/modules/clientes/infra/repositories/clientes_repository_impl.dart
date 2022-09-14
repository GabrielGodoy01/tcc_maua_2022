import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';

import '../../domain/repositories/clientes_repository_interface.dart';
import '../datasources/clientes_datasource_interface.dart';

class ClientesRepositoryImpl implements ClientesRepositoryInterface {
  final ClientesDatasourceInterface datasource;

  ClientesRepositoryImpl({required this.datasource});

  @override
  Future<void> salvarItem(ClientesModel item) async {
    await datasource.postItem(item);
  }
}
