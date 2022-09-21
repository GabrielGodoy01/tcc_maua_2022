// Mocks generated by Mockito 5.3.1 from annotations
// in tcc_maua_2022/test/app/modules/estoque/presentation/controllers/estoque_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tcc_maua_2022/app/modules/estoque/domain/repositories/estoque_repository_interface.dart'
    as _i2;
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [EstoqueRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockEstoqueRepositoryInterface extends _i1.Mock
    implements _i2.EstoqueRepositoryInterface {
  MockEstoqueRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> criarNovoItem(_i4.EstoqueModel? item) => (super.noSuchMethod(
        Invocation.method(
          #criarNovoItem,
          [item],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> alterarItem(_i4.EstoqueModel? item) => (super.noSuchMethod(
        Invocation.method(
          #alterarItem,
          [item],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.EstoqueModel>> obterTodosEstoques() =>
      (super.noSuchMethod(
        Invocation.method(
          #obterTodosEstoques,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.EstoqueModel>>.value(<_i4.EstoqueModel>[]),
      ) as _i3.Future<List<_i4.EstoqueModel>>);
}
