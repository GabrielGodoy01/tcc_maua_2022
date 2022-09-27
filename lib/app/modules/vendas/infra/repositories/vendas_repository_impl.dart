import '../../domain/repositories/vendas_repository_interface.dart';
import '../datasources/vendas_datasource_interface.dart';
import '../model/vendas_model.dart';

class VendasRepositoryImpl implements VendasRepositoryInterface {
  final VendasDatasourceInterface datasource;

  VendasRepositoryImpl({required this.datasource});

  @override
  Future<void> registrarVenda(VendasModel venda) async {
    await datasource.postVenda(venda);
  }

  @override
  Future<void> registrarOrcamento(VendasModel venda) async {
    await datasource.postOrcamento(venda);
  }
}
