import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';

import '../../domain/repositories/clientes_repository_interface.dart';
import '../datasources/clientes_datasource_interface.dart';

class ClientesRepositoryImpl implements ClientesRepositoryInterface {
  final ClientesDatasourceInterface datasource;

  ClientesRepositoryImpl({required this.datasource});

  List<ClientesModel> clientes = List.empty();

  @override
  Future<void> alterarItem(ClientesModel item) async {
    var index =
        clientes.indexWhere((element) => element.idCliente == item.idCliente);
    clientes.removeAt(index);
    clientes.insert(index, item);
    await datasource.putItem(item);
  }

  @override
  Future<void> criarNovoItem(ClientesModel item) async {
    clientes.add(item);
    await datasource.postItem(item);
  }

  @override
  Future<List<ClientesModel>> obterTodosClientes() async {
    if (clientes.isEmpty) {
      clientes = await datasource.getAllItems();
    }
    return Future.value(clientes);
  }
}
