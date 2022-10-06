import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/estoque/relatorios_estoque_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/orcamento/relatorios_orcamento_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/vendas/relatorios_vendas_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/relatorios_page.dart';

class RelatoriosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RelatoriosEstoqueController>(
        (i) => RelatoriosEstoqueController(repository: i())),
    Bind.lazySingleton<RelatoriosVendasController>(
        (i) => RelatoriosVendasController(repository: i())),
    Bind.lazySingleton<RelatoriosOrcamentoController>(
        (i) => RelatoriosOrcamentoController(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const RelatoriosPage(),
    ),
  ];
}
