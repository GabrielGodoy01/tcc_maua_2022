import '../../domain/repositories/estoque_repository_interface.dart';
import '../datasources/estoque_datasource_interface.dart';
import '../model/estoque_model.dart';

class EstoqueRepositoryImpl implements EstoqueRepositoryInterface {
  final EstoqueDatasourceInterface datasource;

  EstoqueRepositoryImpl({required this.datasource});

  @override
  Future<void> alterarItem(EstoqueModel item) async {
    await datasource.putItem(item);
  }

  @override
  Future<void> criarNovoItem(EstoqueModel item) async {
    await datasource.postItem(item);
  }

  @override
  Future<List<EstoqueModel>> obterTodosEstoques() async {
    return await datasource.getAllItems();
  }
}
