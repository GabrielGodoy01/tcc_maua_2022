// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorios_orcamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelatoriosOrcamentoController
    on RelatoriosOrcamentoControllerBase, Store {
  late final _$listaOrcamentosAtom = Atom(
      name: 'RelatoriosOrcamentoControllerBase.listaOrcamentos',
      context: context);

  @override
  List<VendasModel> get listaOrcamentos {
    _$listaOrcamentosAtom.reportRead();
    return super.listaOrcamentos;
  }

  @override
  set listaOrcamentos(List<VendasModel> value) {
    _$listaOrcamentosAtom.reportWrite(value, super.listaOrcamentos, () {
      super.listaOrcamentos = value;
    });
  }

  late final _$listaPanelOrcamentosAtom = Atom(
      name: 'RelatoriosOrcamentoControllerBase.listaPanelOrcamentos',
      context: context);

  @override
  List<VendasPanelModel> get listaPanelOrcamentos {
    _$listaPanelOrcamentosAtom.reportRead();
    return super.listaPanelOrcamentos;
  }

  @override
  set listaPanelOrcamentos(List<VendasPanelModel> value) {
    _$listaPanelOrcamentosAtom.reportWrite(value, super.listaPanelOrcamentos,
        () {
      super.listaPanelOrcamentos = value;
    });
  }

  late final _$obterTodosOrcamentosAsyncAction = AsyncAction(
      'RelatoriosOrcamentoControllerBase.obterTodosOrcamentos',
      context: context);

  @override
  Future<dynamic> obterTodosOrcamentos() {
    return _$obterTodosOrcamentosAsyncAction
        .run(() => super.obterTodosOrcamentos());
  }

  late final _$RelatoriosOrcamentoControllerBaseActionController =
      ActionController(
          name: 'RelatoriosOrcamentoControllerBase', context: context);

  @override
  void setOrcamentoAction() {
    final _$actionInfo =
        _$RelatoriosOrcamentoControllerBaseActionController.startAction(
            name: 'RelatoriosOrcamentoControllerBase.setOrcamentoAction');
    try {
      return super.setOrcamentoAction();
    } finally {
      _$RelatoriosOrcamentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void swapOpen(int index) {
    final _$actionInfo = _$RelatoriosOrcamentoControllerBaseActionController
        .startAction(name: 'RelatoriosOrcamentoControllerBase.swapOpen');
    try {
      return super.swapOpen(index);
    } finally {
      _$RelatoriosOrcamentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaOrcamentos: ${listaOrcamentos},
listaPanelOrcamentos: ${listaPanelOrcamentos}
    ''';
  }
}
