import '../../infra/model/vendas_model.dart';

abstract class VendasRepositoryInterface {
  Future<void> registrarVenda(VendasModel venda);
}
