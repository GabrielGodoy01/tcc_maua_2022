import '../model/estoque_model.dart';

abstract class EstoqueDatasourceInterface {
  Future postItem(EstoqueModel item);
  Future putItem(EstoqueModel item);
  Future<List<EstoqueModel>> getAllItems();
}
