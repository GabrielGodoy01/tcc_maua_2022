import 'package:tcc_maua_2022/app/modules/vendas/infra/model/vendas_model.dart';

class VendasPanelModel {
  bool _isOpen = false;
  final VendasModel vendas;

  VendasPanelModel({required this.vendas});

  void changeStateIsOpen() {
    _isOpen = !_isOpen;
  }

  bool get isOpen => _isOpen;
}
