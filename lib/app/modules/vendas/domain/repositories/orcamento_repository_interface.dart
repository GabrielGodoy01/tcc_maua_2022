import '../../infra/model/vendas_model.dart';

abstract class OrcamentoRepositoryInterface {
  Future<void> registrarOrcamento(VendasModel venda);
  Future<List<VendasModel>> obterTodosOrcamentos();
}
