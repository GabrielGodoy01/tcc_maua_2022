import '../../../estoque/infra/model/estoque_model.dart';

class EstoqueVendaModel {
  final EstoqueModel estoque;
  final int quantidade;
  final double? custoFinal;

  EstoqueVendaModel(
      {this.custoFinal, required this.estoque, required this.quantidade});

  factory EstoqueVendaModel.newInstance() {
    return EstoqueVendaModel(
      estoque: EstoqueModel.newInstance(),
      quantidade: 0,
      custoFinal: 0.0,
    );
  }

  EstoqueVendaModel copyWith({
    EstoqueModel? estoque,
    int? quantidade,
    double? custoFinal,
  }) {
    return EstoqueVendaModel(
      estoque: estoque ?? this.estoque,
      quantidade: quantidade ?? this.quantidade,
      custoFinal: custoFinal ?? this.custoFinal,
    );
  }
}
