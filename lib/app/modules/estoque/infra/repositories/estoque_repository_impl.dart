import '../../domain/repositories/estoque_repository_interface.dart';
import '../datasources/estoque_datasource_interface.dart';
import '../model/estoque_model.dart';

class EstoqueRepositoryImpl implements EstoqueRepositoryInterface {
  final EstoqueDatasourceInterface datasource;

  EstoqueRepositoryImpl({required this.datasource});

  List<EstoqueModel> estoque = List.empty();

  @override
  Future<void> alterarItem(EstoqueModel item) async {
    var index =
        estoque.indexWhere((element) => element.idEstoque == item.idEstoque);
    estoque.removeAt(index);
    estoque.insert(index, item);
    await datasource.putItem(item);
  }

  @override
  Future<void> criarNovoItem(EstoqueModel item) async {
    estoque.add(item);
    await datasource.postItem(item);
  }

  @override
  Future<List<EstoqueModel>> obterTodosEstoques() async {
    if (estoque.isEmpty) {
      estoque = await datasource.getAllItems();
    }
    return Future.value(estoque);
  }
}
