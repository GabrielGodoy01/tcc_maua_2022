import '../model/vendas_model.dart';

abstract class VendasDatasourceInterface {
  Future postVenda(VendasModel venda);
}
