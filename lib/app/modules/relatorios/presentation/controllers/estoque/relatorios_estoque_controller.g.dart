// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorios_estoque_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelatoriosEstoqueController on RelatoriosEstoqueControllerBase, Store {
  late final _$listaItensEstoqueAtom = Atom(
      name: 'RelatoriosEstoqueControllerBase.listaItensEstoque',
      context: context);

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

  late final _$obterTodosEstoqueAsyncAction = AsyncAction(
      'RelatoriosEstoqueControllerBase.obterTodosEstoque',
      context: context);

  @override
  Future<dynamic> obterTodosEstoque() {
    return _$obterTodosEstoqueAsyncAction.run(() => super.obterTodosEstoque());
  }

  @override
  String toString() {
    return '''
listaItensEstoque: ${listaItensEstoque}
    ''';
  }
}
