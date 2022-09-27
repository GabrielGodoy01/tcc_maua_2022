import 'package:mobx/mobx.dart';

import '../../../../vendas/domain/repositories/orcamento_repository_interface.dart';
import '../../../../vendas/infra/model/vendas_model.dart';
import '../../../../vendas/infra/model/vendas_panel_model.dart';

part 'relatorios_orcamento_controller.g.dart';

class RelatoriosOrcamentoController = RelatoriosOrcamentoControllerBase
    with _$RelatoriosOrcamentoController;

abstract class RelatoriosOrcamentoControllerBase with Store {
  final OrcamentoRepositoryInterface repository;

  RelatoriosOrcamentoControllerBase({required this.repository}) {
    obterTodosOrcamentos();
  }

  @observable
  List<VendasModel> listaOrcamentos = [];

  @observable
  List<VendasPanelModel> listaPanelOrcamentos = [];

  @action
  void setOrcamentoAction() {
    var list = <VendasPanelModel>[];
    for (var i = 0; i < listaOrcamentos.length; i++) {
      list.add(VendasPanelModel(vendas: listaOrcamentos[i]));
    }
    listaPanelOrcamentos = list;
  }

  @action
  void swapOpen(int index) {
    var lista = List<VendasPanelModel>.from(listaPanelOrcamentos);
    lista[index].changeStateIsOpen();
    listaPanelOrcamentos = lista;
  }

  @action
  Future obterTodosOrcamentos() async {
    listaOrcamentos = await repository.obterTodosOrcamentos();
    setOrcamentoAction();
  }
}
