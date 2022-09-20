// Mocks generated by Mockito 5.3.1 from annotations
// in tcc_maua_2022/test/app/modules/clientes/presentation/controllers/clientes_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tcc_maua_2022/app/modules/clientes/domain/repositories/clientes_repository_interface.dart'
    as _i4;
import 'package:tcc_maua_2022/app/modules/clientes/external/busca_cep_datasource.dart'
    as _i7;
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart'
    as _i6;
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/resultado_busca_cep_model.dart'
    as _i3;

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

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResultadoBuscaCepModel_1 extends _i1.SmartFake
    implements _i3.ResultadoBuscaCepModel {
  _FakeResultadoBuscaCepModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ClientesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientesRepositoryInterface extends _i1.Mock
    implements _i4.ClientesRepositoryInterface {
  MockClientesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> alterarItem(_i6.ClientesModel? item) => (super.noSuchMethod(
        Invocation.method(
          #alterarItem,
          [item],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> criarNovoItem(_i6.ClientesModel? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #criarNovoItem,
          [item],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [BuscaCepDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuscaCepDatasource extends _i1.Mock
    implements _i7.BuscaCepDatasource {
  MockBuscaCepDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i5.Future<_i3.ResultadoBuscaCepModel> getCepExterno(String? cep) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCepExterno,
          [cep],
        ),
        returnValue: _i5.Future<_i3.ResultadoBuscaCepModel>.value(
            _FakeResultadoBuscaCepModel_1(
          this,
          Invocation.method(
            #getCepExterno,
            [cep],
          ),
        )),
      ) as _i5.Future<_i3.ResultadoBuscaCepModel>);
}