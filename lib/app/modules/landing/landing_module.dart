import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/home/home_module.dart';
import 'package:tcc_maua_2022/app/modules/vendas/vendas_module.dart';

import '../../shared/widgets/vertical-appbar/controller/appbar_controller.dart';
import '../clientes/clientes_module.dart';
import '../estoque/estoque_module.dart';
import 'landing_page.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppbarController>((i) => AppbarController()),
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
        ]),
  ];
}
