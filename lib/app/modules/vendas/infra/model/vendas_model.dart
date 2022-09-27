import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';
import 'package:tcc_maua_2022/app/modules/vendas/infra/model/estoque_venda_model.dart';

import '../../domain/infra/tipo_pagamento_enum.dart';

class VendasModel {
  final ClientesModel cliente;
  final List<EstoqueVendaModel> listaItensVenda;
  final double custoFinal;
  final TipoPagamentoEnum? tipoPagamento;

  VendasModel(
      {required this.custoFinal,
      this.tipoPagamento,
      required this.cliente,
      required this.listaItensVenda});

  factory VendasModel.newInstance() {
    return VendasModel(
      cliente: ClientesModel.newInstance(),
      listaItensVenda: [],
      tipoPagamento: null,
      custoFinal: 0.0,
    );
  }

  VendasModel copyWith({
    ClientesModel? cliente,
    List<EstoqueVendaModel>? listaItensVenda,
    TipoPagamentoEnum? tipoPagamento,
    double? custoFinal,
  }) {
    return VendasModel(
      cliente: cliente ?? this.cliente,
      listaItensVenda: listaItensVenda ?? this.listaItensVenda,
      tipoPagamento: tipoPagamento ?? this.tipoPagamento,
      custoFinal: custoFinal ?? this.custoFinal,
    );
  }
}
