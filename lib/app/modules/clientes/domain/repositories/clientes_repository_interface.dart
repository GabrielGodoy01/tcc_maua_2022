import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';

abstract class ClientesRepositoryInterface {
  Future<void> salvarItem(ClientesModel item);
}
