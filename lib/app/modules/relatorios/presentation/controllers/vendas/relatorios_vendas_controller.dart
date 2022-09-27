import 'package:mobx/mobx.dart';
import 'package:tcc_maua_2022/app/modules/vendas/infra/model/vendas_model.dart';

import '../../../../vendas/domain/repositories/vendas_repository_interface.dart';
import '../../../../vendas/infra/model/vendas_panel_model.dart';

part 'relatorios_vendas_controller.g.dart';

class RelatoriosVendasController = RelatoriosVendasControllerBase
    with _$RelatoriosVendasController;

abstract class RelatoriosVendasControllerBase with Store {
  final VendasRepositoryInterface repository;

  RelatoriosVendasControllerBase({required this.repository}) {
    obterTodasVendas();
  }

  @observable
  List<VendasModel> listaVendas = [];

  @observable
  List<VendasPanelModel> listaPanelVendas = [];

  @action
  void setVendasAction() {
    var list = <VendasPanelModel>[];
    for (var i = 0; i < listaVendas.length; i++) {
      list.add(VendasPanelModel(vendas: listaVendas[i]));
    }
    listaPanelVendas = list;
  }

  @action
  void swapOpen(int index) {
    var lista = List<VendasPanelModel>.from(listaPanelVendas);
    lista[index].changeStateIsOpen();
    listaPanelVendas = lista;
  }

  @action
  Future obterTodasVendas() async {
    listaVendas = await repository.obterTodasVendas();
    setVendasAction();
  }
}
