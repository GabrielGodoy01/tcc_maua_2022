import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/relatorios_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/relatorio_estoque_page.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/relatorios_page.dart';

import '../estoque/domain/repositories/estoque_repository_interface.dart';
import '../estoque/external/estoque_datasource_impl.dart';
import '../estoque/infra/datasources/estoque_datasource_interface.dart';
import '../estoque/infra/repositories/estoque_repository_impl.dart';

class RelatoriosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RelatoriosController>(
        (i) => RelatoriosController(repository: i())),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
    Bind.lazySingleton<EstoqueDatasourceInterface>(
        (i) => EstoqueDatasourceImpl(dioClient: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const RelatoriosPage(),
    ),
    ChildRoute(
      '/estoque',
      child: (context, args) => const RelatorioEstoquePage(),
    ),
  ];
}
