import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';

import '../../domain/repositories/clientes_repository_interface.dart';
import '../datasources/clientes_datasource_interface.dart';

class ClientesRepositoryImpl implements ClientesRepositoryInterface {
  final ClientesDatasourceInterface datasource;

  ClientesRepositoryImpl({required this.datasource});

  @override
  Future<void> alterarItem(ClientesModel item) async {
    await datasource.putItem(item);
  }

  @override
  Future<void> criarNovoItem(ClientesModel item) async {
    await datasource.postItem(item);
  }

  @override
  Future<List<ClientesModel>> obterTodosClientes() async {
    return await datasource.getAllItems();
  }
}
