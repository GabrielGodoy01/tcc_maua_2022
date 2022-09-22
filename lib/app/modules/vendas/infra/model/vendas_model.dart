import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';
import 'package:tcc_maua_2022/app/modules/vendas/infra/model/estoque_venda_model.dart';

class VendasModel {
  final ClientesModel cliente;
  final List<EstoqueVendaModel> listaItensVenda;

  VendasModel({required this.cliente, required this.listaItensVenda});

  factory VendasModel.newInstance() {
    return VendasModel(
      cliente: ClientesModel.newInstance(),
      listaItensVenda: [],
    );
  }

  VendasModel copyWith({
    ClientesModel? cliente,
    List<EstoqueVendaModel>? listaItensVenda,
    double? custoFinal,
  }) {
    return VendasModel(
      cliente: cliente ?? this.cliente,
      listaItensVenda: listaItensVenda ?? this.listaItensVenda,
    );
  }
}
