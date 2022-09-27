import '../model/vendas_model.dart';

abstract class OrcamentoDatasourceInterface {
  Future postOrcamento(VendasModel venda);
  Future<List<VendasModel>> getOrcamentos();
}
