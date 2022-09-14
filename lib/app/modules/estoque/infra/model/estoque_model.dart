import 'package:tcc_maua_2022/app/modules/estoque/domain/infra/unidade_estoque_enum.dart';

class EstoqueModel {
  final int? idEstoque;
  final String descricao;
  final String? localizacao;
  final UnidadeItemEnum? unidadeItem;
  final int quantidade;
  final int estoqueMinimo;
  final int estoqueMaximo;
  final double? custo;

  EstoqueModel({
    required this.quantidade,
    this.idEstoque,
    required this.descricao,
    this.localizacao,
    this.unidadeItem,
    required this.estoqueMinimo,
    required this.estoqueMaximo,
    this.custo,
  });

  factory EstoqueModel.newInstance() {
    return EstoqueModel(
      idEstoque: null,
      descricao: '',
      localizacao: '',
      unidadeItem: null,
      quantidade: 0,
      estoqueMinimo: 0,
      estoqueMaximo: 0,
      custo: 0,
    );
  }

  EstoqueModel copyWith({
    int? idEstoque,
    String? descricao,
    String? localizacao,
    UnidadeItemEnum? unidadeItem,
    int? quantidade,
    int? estoqueMinimo,
    int? estoqueMaximo,
    double? custo,
  }) {
    return EstoqueModel(
      idEstoque: idEstoque ?? this.idEstoque,
      descricao: descricao ?? this.descricao,
      localizacao: localizacao ?? this.localizacao,
      unidadeItem: unidadeItem ?? this.unidadeItem,
      quantidade: quantidade ?? this.quantidade,
      estoqueMinimo: estoqueMinimo ?? this.estoqueMinimo,
      estoqueMaximo: estoqueMaximo ?? this.estoqueMaximo,
      custo: custo ?? this.custo,
    );
  }
}
