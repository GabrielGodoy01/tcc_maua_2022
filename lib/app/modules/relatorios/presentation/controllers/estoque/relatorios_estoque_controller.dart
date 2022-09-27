import 'package:mobx/mobx.dart';

import '../../../../estoque/domain/repositories/estoque_repository_interface.dart';
import '../../../../estoque/infra/model/estoque_model.dart';

part 'relatorios_estoque_controller.g.dart';

class RelatoriosEstoqueController = RelatoriosEstoqueControllerBase
    with _$RelatoriosEstoqueController;

abstract class RelatoriosEstoqueControllerBase with Store {
  final EstoqueRepositoryInterface repository;

  RelatoriosEstoqueControllerBase({required this.repository}) {
    obterTodosEstoque();
  }

  @observable
  List<EstoqueModel> listaItensEstoque = [];

  @action
  Future obterTodosEstoque() async {
    listaItensEstoque = await repository.obterTodosEstoques();
  }
}
