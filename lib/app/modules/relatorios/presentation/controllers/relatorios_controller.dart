import 'package:mobx/mobx.dart';

import '../../../estoque/domain/repositories/estoque_repository_interface.dart';
import '../../../estoque/infra/model/estoque_model.dart';

part 'relatorios_controller.g.dart';

class RelatoriosController = RelatoriosControllerBase
    with _$RelatoriosController;

abstract class RelatoriosControllerBase with Store {
  final EstoqueRepositoryInterface repository;

  RelatoriosControllerBase({required this.repository}) {
    obterTodosEstoque();
  }

  @observable
  List<EstoqueModel> listaItensEstoque = [];

  @action
  Future obterTodosEstoque() async {
    listaItensEstoque = await repository.obterTodosEstoques();
  }
}
