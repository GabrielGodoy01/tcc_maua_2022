enum TipoPagamentoEnum { credito, debito, dinheiro, pix, cheque }

extension TipoPagamentoEnumExtension on TipoPagamentoEnum {
  String get nome {
    switch (this) {
      case TipoPagamentoEnum.credito:
        return 'Crédito';

      case TipoPagamentoEnum.dinheiro:
        return 'Dinheiro';

      case TipoPagamentoEnum.pix:
        return 'PIX';

      case TipoPagamentoEnum.debito:
        return 'Débito';

      case TipoPagamentoEnum.cheque:
        return 'Cheque';
    }
  }
}
