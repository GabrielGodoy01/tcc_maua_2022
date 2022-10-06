import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/home/home_module.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/relatorios_module.dart';
import 'package:tcc_maua_2022/app/modules/vendas/vendas_module.dart';

import '../../shared/widgets/vertical-appbar/controller/appbar_controller.dart';
import '../clientes/clientes_module.dart';
import '../estoque/domain/repositories/estoque_repository_interface.dart';
import '../estoque/estoque_module.dart';
import '../estoque/external/estoque_datasource_impl.dart';
import '../estoque/infra/datasources/estoque_datasource_interface.dart';
import '../estoque/infra/repositories/estoque_repository_impl.dart';
import '../vendas/domain/repositories/orcamento_repository_interface.dart';
import '../vendas/domain/repositories/vendas_repository_interface.dart';
import '../vendas/external/orcamento_datasource_impl.dart';
import '../vendas/external/vendas_datasource_impl.dart';
import '../vendas/infra/datasources/orcamento_datasource_interface.dart';
import '../vendas/infra/datasources/vendas_datasource_interface.dart';
import '../vendas/infra/repositories/orcamento_repository_impl.dart';
import '../vendas/infra/repositories/vendas_repository_impl.dart';
import 'landing_page.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppbarController>((i) => AppbarController()),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
    Bind.lazySingleton<EstoqueDatasourceInterface>(
        (i) => EstoqueDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<VendasDatasourceInterface>(
        (i) => VendasDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<VendasRepositoryInterface>(
        (i) => VendasRepositoryImpl(datasource: i())),
    Bind.lazySingleton<OrcamentoDatasourceInterface>(
        (i) => OrcamentoDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<OrcamentoRepositoryInterface>(
        (i) => OrcamentoRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LandingPage(),
        children: [
          ModuleRoute('/estoque', module: EstoqueModule()),
          ModuleRoute('/clientes', module: ClientesModule()),
          ModuleRoute('/home', module: HomeModule()),
          ModuleRoute('/vendas', module: VendasModule()),
          ModuleRoute('/relatorios', module: RelatoriosModule()),
        ]),
  ];
}
