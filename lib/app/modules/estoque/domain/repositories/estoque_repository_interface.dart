import '../../infra/model/estoque_model.dart';

abstract class EstoqueRepositoryInterface {
  Future<void> salvarItem(EstoqueModel item);
}
