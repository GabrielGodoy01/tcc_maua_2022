enum UnidadeItemEnum {
  unitario,
  metroquadrado,
  linear,
}

extension UnidadeItemEnumExtension on UnidadeItemEnum {
  String get name {
    switch (this) {
      case UnidadeItemEnum.unitario:
        return 'Unitário (Un.)';
      case UnidadeItemEnum.metroquadrado:
        return 'Metro Quadrado (m²)';
      case UnidadeItemEnum.linear:
        return 'Metro Linear (m)';
    }
  }
}
