// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estoque_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EstoqueController on EstoqueControllerBase, Store {
  late final _$listaItensEstoqueAtom =
      Atom(name: 'EstoqueControllerBase.listaItensEstoque', context: context);

  @override
  List<EstoqueModel> get listaItensEstoque {
    _$listaItensEstoqueAtom.reportRead();
    return super.listaItensEstoque;
  }

  @override
  set listaItensEstoque(List<EstoqueModel> value) {
    _$listaItensEstoqueAtom.reportWrite(value, super.listaItensEstoque, () {
      super.listaItensEstoque = value;
    });
  }

  late final _$itemAtom =
      Atom(name: 'EstoqueControllerBase.item', context: context);

  @override
  EstoqueModel get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(EstoqueModel value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$salvarItemAsyncAction =
      AsyncAction('EstoqueControllerBase.salvarItem', context: context);

  @override
  Future<void> salvarItem() {
    return _$salvarItemAsyncAction.run(() => super.salvarItem());
  }

  late final _$EstoqueControllerBaseActionController =
      ActionController(name: 'EstoqueControllerBase', context: context);

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocalizacao(String value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setLocalizacao');
    try {
      return super.setLocalizacao(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnidade(UnidadeItemEnum? value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setUnidade');
    try {
      return super.setUnidade(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantidade(int value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setQuantidade');
    try {
      return super.setQuantidade(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstoqueMinimo(int value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setEstoqueMinimo');
    try {
      return super.setEstoqueMinimo(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstoqueMaximo(int value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setEstoqueMaximo');
    try {
      return super.setEstoqueMaximo(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCusto(double value) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setCusto');
    try {
      return super.setCusto(value);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstoque(int id) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.setEstoque');
    try {
      return super.setEstoque(id);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparTexto() {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.limparTexto');
    try {
      return super.limparTexto();
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectProduto(int id) {
    final _$actionInfo = _$EstoqueControllerBaseActionController.startAction(
        name: 'EstoqueControllerBase.selectProduto');
    try {
      return super.selectProduto(id);
    } finally {
      _$EstoqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaItensEstoque: ${listaItensEstoque},
item: ${item}
    ''';
  }
}
