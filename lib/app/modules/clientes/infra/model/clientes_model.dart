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
    int? idCliente,
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
      idCliente: idCliente ?? this.idCliente,
      email: email ?? this.email,
    );
  }
}
