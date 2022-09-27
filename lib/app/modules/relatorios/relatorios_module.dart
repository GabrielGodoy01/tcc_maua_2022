import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/estoque/relatorios_estoque_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/vendas/relatorios_vendas_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/relatorios_page.dart';
import '../estoque/domain/repositories/estoque_repository_interface.dart';
import '../estoque/external/estoque_datasource_impl.dart';
import '../estoque/infra/datasources/estoque_datasource_interface.dart';
import '../estoque/infra/repositories/estoque_repository_impl.dart';
import '../vendas/domain/repositories/vendas_repository_interface.dart';
import '../vendas/external/vendas_datasource_impl.dart';
import '../vendas/infra/datasources/vendas_datasource_interface.dart';
import '../vendas/infra/repositories/vendas_repository_impl.dart';

class RelatoriosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RelatoriosEstoqueController>(
        (i) => RelatoriosEstoqueController(repository: i())),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
    Bind.lazySingleton<EstoqueDatasourceInterface>(
        (i) => EstoqueDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<RelatoriosVendasController>(
        (i) => RelatoriosVendasController(repository: i())),
    Bind.lazySingleton<VendasDatasourceInterface>(
        (i) => VendasDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<VendasRepositoryInterface>(
        (i) => VendasRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const RelatoriosPage(),
    ),
  ];
}
