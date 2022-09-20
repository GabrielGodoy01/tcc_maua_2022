import 'dart:convert';

class EnderecoModel {
  final String? cep;
  final String? endereco;
  final String? numero;
  final String? complemento;
  final String? bairro;
  final String? cidade;
  final String? estado;

  EnderecoModel(
      {this.cep,
      this.endereco,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado});

  factory EnderecoModel.newInstance() {
    return EnderecoModel(
        bairro: '',
        cep: '',
        cidade: '',
        complemento: '',
        endereco: '',
        estado: '',
        numero: '');
  }

  EnderecoModel copyWith({
    String? cep,
    String? endereco,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? estado,
  }) {
    return EnderecoModel(
      cep: cep ?? this.cep,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'endereco': endereco,
      'numero': numero,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'],
      endereco: map['endereco'],
      numero: map['numero'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
