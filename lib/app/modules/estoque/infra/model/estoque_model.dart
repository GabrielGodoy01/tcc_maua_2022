import 'dart:convert';

class EstoqueModel {
  final int? idEstoque;
  final String descricao;
  final String? localizacao;
  final int quantidade;
  final int estoqueMinimo;
  final int estoqueMaximo;
  final double custo;

  EstoqueModel({
    required this.quantidade,
    this.idEstoque,
    required this.descricao,
    this.localizacao,
    required this.estoqueMinimo,
    required this.estoqueMaximo,
    required this.custo,
  });

  factory EstoqueModel.newInstance() {
    return EstoqueModel(
      idEstoque: null,
      descricao: '',
      localizacao: '',
      quantidade: 0,
      estoqueMinimo: 0,
      estoqueMaximo: 0,
      custo: 0.0,
    );
  }

  EstoqueModel copyWith({
    String? descricao,
    String? localizacao,
    int? quantidade,
    int? estoqueMinimo,
    int? estoqueMaximo,
    double? custo,
  }) {
    return EstoqueModel(
      descricao: descricao ?? this.descricao,
      localizacao: localizacao ?? this.localizacao,
      quantidade: quantidade ?? this.quantidade,
      estoqueMinimo: estoqueMinimo ?? this.estoqueMinimo,
      estoqueMaximo: estoqueMaximo ?? this.estoqueMaximo,
      custo: custo ?? this.custo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idEstoque': idEstoque,
      'descricao': descricao,
      'localizacao': localizacao,
      'quantidade': quantidade,
      'estoqueMinimo': estoqueMinimo,
      'estoqueMaximo': estoqueMaximo,
      'custo': custo,
    };
  }

  factory EstoqueModel.fromMap(Map<String, dynamic> map) {
    return EstoqueModel(
      idEstoque: map['idEstoque']?.toInt(),
      descricao: map['descricao'] ?? '',
      localizacao: map['localizacao'],
      quantidade: map['quantidade']?.toInt() ?? 0,
      estoqueMinimo: map['estoqueMinimo']?.toInt() ?? 0,
      estoqueMaximo: map['estoqueMaximo']?.toInt() ?? 0,
      custo: map['custo']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory EstoqueModel.fromJson(String source) =>
      EstoqueModel.fromMap(json.decode(source));
}
