import '../../infra/model/estoque_model.dart';

abstract class EstoqueRepositoryInterface {
  Future<void> criarNovoItem(EstoqueModel item);
  Future<void> alterarItem(EstoqueModel item);
  Future<List<EstoqueModel>> obterTodosEstoques();
}
