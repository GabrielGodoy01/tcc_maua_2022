import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';

abstract class ClientesRepositoryInterface {
  Future<void> alterarItem(ClientesModel item);
  Future<void> criarNovoItem(ClientesModel item);
  Future<List<ClientesModel>> obterTodosClientes();
}
