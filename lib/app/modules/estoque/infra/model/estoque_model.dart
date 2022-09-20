class EstoqueModel {
  final int? idEstoque;
  final String descricao;
  final String? localizacao;
  final int quantidade;
  final int estoqueMinimo;
  final int estoqueMaximo;
  final double? custo;

  EstoqueModel({
    required this.quantidade,
    this.idEstoque,
    required this.descricao,
    this.localizacao,
    required this.estoqueMinimo,
    required this.estoqueMaximo,
    this.custo,
  });

  factory EstoqueModel.newInstance() {
    return EstoqueModel(
      idEstoque: null,
      descricao: '',
      localizacao: '',
      quantidade: 0,
      estoqueMinimo: 0,
      estoqueMaximo: 0,
      custo: 0,
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
}
