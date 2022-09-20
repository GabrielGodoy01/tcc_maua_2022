class ResultadoBuscaCepModel {
  final String? cep;
  final String? logradouro;
  final String? bairro;
  final String? localidade;
  final String? uf;

  ResultadoBuscaCepModel({
    this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
  });

  factory ResultadoBuscaCepModel.fromMap(Map<String, dynamic> json) =>
      ResultadoBuscaCepModel(
        cep: json['cep'] as String,
        logradouro: json['logradouro'] as String,
        bairro: json['bairro'] as String,
        localidade: json['localidade'] as String,
        uf: json['uf'] as String,
      );

  Map<String, dynamic> toMap() => {
        'cep': cep,
        'logradouro': logradouro,
        'bairro': bairro,
        'localidade': localidade,
        'uf': uf,
      };

  factory ResultadoBuscaCepModel.newInstance() {
    return ResultadoBuscaCepModel(
      bairro: null,
      cep: null,
      localidade: null,
      logradouro: null,
      uf: null,
    );
  }

  ResultadoBuscaCepModel copyWith({
    String? cep,
    String? logradouro,
    String? bairro,
    String? localidade,
    String? uf,
  }) {
    return ResultadoBuscaCepModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
    );
  }
}
