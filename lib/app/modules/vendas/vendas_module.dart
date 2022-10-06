import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/controllers/vendas_controller.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/selecao_cliente_page.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/selecao_pagamento_page.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/vendas_page.dart';

class VendasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<VendasController>(
      (i) => VendasController(
        clientesRepository: i(),
        estoqueRepository: i(),
        vendasRepository: i(),
        orcamentoRepository: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SelecaoClientePage(),
    ),
    ChildRoute(
      '/listarVenda',
      child: (context, args) => const VendasPage(),
    ),
    ChildRoute(
      '/pagamento',
      child: (context, args) => const SelecaoPagamentoPage(),
    ),
  ];
}
