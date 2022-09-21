import '../../domain/vendas_repository_interface.dart';
import '../datasources/vendas_datasource.interface.dart';

class VendasRepositoryImpl implements VendasRepositoryInterface {
  final VendasDatasourceInterface datasource;

  VendasRepositoryImpl({required this.datasource});

  @override
  Future<void> registrarVenda() async {
    await datasource.postVenda();
  }
}
