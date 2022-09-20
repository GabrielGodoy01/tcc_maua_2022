// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientesController on ClientesControllerBase, Store {
  late final _$clienteAtom =
      Atom(name: 'ClientesControllerBase.cliente', context: context);

  @override
  ClientesModel get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ClientesModel value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  late final _$enderecoClienteAtom =
      Atom(name: 'ClientesControllerBase.enderecoCliente', context: context);

  @override
  ResultadoBuscaCepModel get enderecoCliente {
    _$enderecoClienteAtom.reportRead();
    return super.enderecoCliente;
  }

  @override
  set enderecoCliente(ResultadoBuscaCepModel value) {
    _$enderecoClienteAtom.reportWrite(value, super.enderecoCliente, () {
      super.enderecoCliente = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: 'ClientesControllerBase.endereco', context: context);

  @override
  EnderecoModel get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(EnderecoModel value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$listaClientesAtom =
      Atom(name: 'ClientesControllerBase.listaClientes', context: context);

  @override
  List<ClientesModel> get listaClientes {
    _$listaClientesAtom.reportRead();
    return super.listaClientes;
  }

  @override
  set listaClientes(List<ClientesModel> value) {
    _$listaClientesAtom.reportWrite(value, super.listaClientes, () {
      super.listaClientes = value;
    });
  }

  late final _$cepErrorAtom =
      Atom(name: 'ClientesControllerBase.cepError', context: context);

  @override
  String get cepError {
    _$cepErrorAtom.reportRead();
    return super.cepError;
  }

  @override
  set cepError(String value) {
    _$cepErrorAtom.reportWrite(value, super.cepError, () {
      super.cepError = value;
    });
  }

  late final _$procuraCepAsyncAction =
      AsyncAction('ClientesControllerBase.procuraCep', context: context);

  @override
  Future<void> procuraCep(String cep) {
    return _$procuraCepAsyncAction.run(() => super.procuraCep(cep));
  }

  late final _$salvarClienteAsyncAction =
      AsyncAction('ClientesControllerBase.salvarCliente', context: context);

  @override
  Future<void> salvarCliente() {
    return _$salvarClienteAsyncAction.run(() => super.salvarCliente());
  }

  late final _$ClientesControllerBaseActionController =
      ActionController(name: 'ClientesControllerBase', context: context);

  @override
  void setNome(String nome) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRazaoSocial(String razaoSocial) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setRazaoSocial');
    try {
      return super.setRazaoSocial(razaoSocial);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String cpf) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setCpf');
    try {
      return super.setCpf(cpf);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone1(String telefone1) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setTelefone1');
    try {
      return super.setTelefone1(telefone1);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone2(String telefone2) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setTelefone2');
    try {
      return super.setTelefone2(telefone2);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone3(String telefone3) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setTelefone3');
    try {
      return super.setTelefone3(telefone3);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeContato(String nomeContato) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setNomeContato');
    try {
      return super.setNomeContato(nomeContato);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRgContato(String rgContato) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setRgContato');
    try {
      return super.setRgContato(rgContato);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String cep) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setCep');
    try {
      return super.setCep(cep);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String numero) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setNumero');
    try {
      return super.setNumero(numero);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplemento(String? complemento) {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.setComplemento');
    try {
      return super.setComplemento(complemento);
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparTexto() {
    final _$actionInfo = _$ClientesControllerBaseActionController.startAction(
        name: 'ClientesControllerBase.limparTexto');
    try {
      return super.limparTexto();
    } finally {
      _$ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente},
enderecoCliente: ${enderecoCliente},
endereco: ${endereco},
listaClientes: ${listaClientes},
cepError: ${cepError}
    ''';
  }
}
