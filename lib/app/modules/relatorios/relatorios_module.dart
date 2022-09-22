import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/relatorios_controller.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/relatorios_page.dart';

import '../estoque/domain/repositories/estoque_repository_interface.dart';
import '../estoque/infra/repositories/estoque_repository_impl.dart';

class RelatoriosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RelatoriosController>(
        (i) => RelatoriosController(repository: i())),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const RelatoriosPage(),
    ),
  ];
}
