// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendasController on VendasControllerBase, Store {
  Computed<double>? _$getTotalComputed;

  @override
  double get getTotal =>
      (_$getTotalComputed ??= Computed<double>(() => super.getTotal,
              name: 'VendasControllerBase.getTotal'))
          .value;

  late final _$vendaAtom =
      Atom(name: 'VendasControllerBase.venda', context: context);

  @override
  VendasModel get venda {
    _$vendaAtom.reportRead();
    return super.venda;
  }

  @override
  set venda(VendasModel value) {
    _$vendaAtom.reportWrite(value, super.venda, () {
      super.venda = value;
    });
  }

  late final _$composicaoAtom =
      Atom(name: 'VendasControllerBase.composicao', context: context);

  @override
  EstoqueVendaModel get composicao {
    _$composicaoAtom.reportRead();
    return super.composicao;
  }

  @override
  set composicao(EstoqueVendaModel value) {
    _$composicaoAtom.reportWrite(value, super.composicao, () {
      super.composicao = value;
    });
  }

  late final _$listaClientesCadastradosAtom = Atom(
      name: 'VendasControllerBase.listaClientesCadastrados', context: context);

  @override
  List<ClientesModel> get listaClientesCadastrados {
    _$listaClientesCadastradosAtom.reportRead();
    return super.listaClientesCadastrados;
  }

  @override
  set listaClientesCadastrados(List<ClientesModel> value) {
    _$listaClientesCadastradosAtom
        .reportWrite(value, super.listaClientesCadastrados, () {
      super.listaClientesCadastrados = value;
    });
  }

  late final _$listaEstoqueCadastradosAtom = Atom(
      name: 'VendasControllerBase.listaEstoqueCadastrados', context: context);

  @override
  List<EstoqueModel> get listaEstoqueCadastrados {
    _$listaEstoqueCadastradosAtom.reportRead();
    return super.listaEstoqueCadastrados;
  }

  @override
  set listaEstoqueCadastrados(List<EstoqueModel> value) {
    _$listaEstoqueCadastradosAtom
        .reportWrite(value, super.listaEstoqueCadastrados, () {
      super.listaEstoqueCadastrados = value;
    });
  }

  late final _$listaCustosAtom =
      Atom(name: 'VendasControllerBase.listaCustos', context: context);

  @override
  ObservableList<double?> get listaCustos {
    _$listaCustosAtom.reportRead();
    return super.listaCustos;
  }

  @override
  set listaCustos(ObservableList<double?> value) {
    _$listaCustosAtom.reportWrite(value, super.listaCustos, () {
      super.listaCustos = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('VendasControllerBase.init', context: context);

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$realizarVendaAsyncAction =
      AsyncAction('VendasControllerBase.realizarVenda', context: context);

  @override
  Future<dynamic> realizarVenda() {
    return _$realizarVendaAsyncAction.run(() => super.realizarVenda());
  }

  late final _$VendasControllerBaseActionController =
      ActionController(name: 'VendasControllerBase', context: context);

  @override
  void setCliente(ClientesModel clientesModel) {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.setCliente');
    try {
      return super.setCliente(clientesModel);
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemEstoque(EstoqueModel estoque) {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.setItemEstoque');
    try {
      return super.setItemEstoque(estoque);
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantidade(int quantidade) {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.setQuantidade');
    try {
      return super.setQuantidade(quantidade);
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustoFinal(int index) {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.setCustoFinal');
    try {
      return super.setCustoFinal(index);
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarComposicao() {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.adicionarComposicao');
    try {
      return super.adicionarComposicao();
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerComposicao(int index) {
    final _$actionInfo = _$VendasControllerBaseActionController.startAction(
        name: 'VendasControllerBase.removerComposicao');
    try {
      return super.removerComposicao(index);
    } finally {
      _$VendasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
venda: ${venda},
composicao: ${composicao},
listaClientesCadastrados: ${listaClientesCadastrados},
listaEstoqueCadastrados: ${listaEstoqueCadastrados},
listaCustos: ${listaCustos},
getTotal: ${getTotal}
    ''';
  }
}
