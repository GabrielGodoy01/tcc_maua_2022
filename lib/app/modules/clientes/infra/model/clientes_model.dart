import 'dart:convert';

import 'endereco_model.dart';

class ClientesModel {
  final String nome;
  final String razaoSocial;
  final String cpf;
  final String nomeContato;
  final String rgContato;
  final EnderecoModel enderecoModel;
  final int? idCliente;
  final List<String> telefones;
  final String email;

  ClientesModel({
    required this.telefones,
    required this.nome,
    required this.razaoSocial,
    required this.cpf,
    required this.nomeContato,
    required this.rgContato,
    required this.email,
    required this.enderecoModel,
    this.idCliente,
  });

  factory ClientesModel.newInstance() {
    return ClientesModel(
      telefones: ['', '', ''],
      nome: '',
      razaoSocial: '',
      cpf: '',
      nomeContato: '',
      rgContato: '',
      enderecoModel: EnderecoModel(
          cep: '',
          bairro: '',
          cidade: '',
          complemento: '',
          endereco: '',
          estado: '',
          numero: ''),
      idCliente: null,
      email: '',
    );
  }

  ClientesModel copyWith({
    List<String>? telefones,
    String? nome,
    String? razaoSocial,
    String? cpf,
    String? nomeContato,
    String? rgContato,
    EnderecoModel? enderecoModel,
    String? email,
  }) {
    return ClientesModel(
      telefones: telefones ?? this.telefones,
      nome: nome ?? this.nome,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      cpf: cpf ?? this.cpf,
      nomeContato: nomeContato ?? this.nomeContato,
      rgContato: rgContato ?? this.rgContato,
      enderecoModel: enderecoModel ?? this.enderecoModel,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'razaoSocial': razaoSocial,
      'cpf': cpf,
      'nomeContato': nomeContato,
      'rgContato': rgContato,
      'enderecoModel': enderecoModel.toMap(),
      'idCliente': idCliente,
      'telefones': telefones,
      'email': email,
    };
  }

  factory ClientesModel.fromMap(Map<String, dynamic> map) {
    return ClientesModel(
      nome: map['nome'] ?? '',
      razaoSocial: map['razaoSocial'] ?? '',
      cpf: map['cpf'] ?? '',
      nomeContato: map['nomeContato'] ?? '',
      rgContato: map['rgContato'] ?? '',
      enderecoModel: EnderecoModel.fromMap(map['enderecoModel']),
      idCliente: map['idCliente']?.toInt(),
      telefones: List<String>.from(map['telefones']),
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientesModel.fromJson(String source) =>
      ClientesModel.fromMap(json.decode(source));
}
