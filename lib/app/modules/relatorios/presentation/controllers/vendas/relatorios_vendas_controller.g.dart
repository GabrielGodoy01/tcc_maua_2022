// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorios_vendas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelatoriosVendasController on RelatoriosVendasControllerBase, Store {
  late final _$listaVendasAtom = Atom(
      name: 'RelatoriosVendasControllerBase.listaVendas', context: context);

  @override
  List<VendasModel> get listaVendas {
    _$listaVendasAtom.reportRead();
    return super.listaVendas;
  }

  @override
  set listaVendas(List<VendasModel> value) {
    _$listaVendasAtom.reportWrite(value, super.listaVendas, () {
      super.listaVendas = value;
    });
  }

  late final _$listaPanelVendasAtom = Atom(
      name: 'RelatoriosVendasControllerBase.listaPanelVendas',
      context: context);

  @override
  List<VendasPanelModel> get listaPanelVendas {
    _$listaPanelVendasAtom.reportRead();
    return super.listaPanelVendas;
  }

  @override
  set listaPanelVendas(List<VendasPanelModel> value) {
    _$listaPanelVendasAtom.reportWrite(value, super.listaPanelVendas, () {
      super.listaPanelVendas = value;
    });
  }

  late final _$obterTodasVendasAsyncAction = AsyncAction(
      'RelatoriosVendasControllerBase.obterTodasVendas',
      context: context);

  @override
  Future<dynamic> obterTodasVendas() {
    return _$obterTodasVendasAsyncAction.run(() => super.obterTodasVendas());
  }

  late final _$RelatoriosVendasControllerBaseActionController =
      ActionController(
          name: 'RelatoriosVendasControllerBase', context: context);

  @override
  void setVendasAction() {
    final _$actionInfo = _$RelatoriosVendasControllerBaseActionController
        .startAction(name: 'RelatoriosVendasControllerBase.setVendasAction');
    try {
      return super.setVendasAction();
    } finally {
      _$RelatoriosVendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void swapOpen(int index) {
    final _$actionInfo = _$RelatoriosVendasControllerBaseActionController
        .startAction(name: 'RelatoriosVendasControllerBase.swapOpen');
    try {
      return super.swapOpen(index);
    } finally {
      _$RelatoriosVendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaVendas: ${listaVendas},
listaPanelVendas: ${listaPanelVendas}
    ''';
  }
}
