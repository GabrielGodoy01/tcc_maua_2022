import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/controllers/estoque_controller.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/ui/estoque/estoque_page.dart';

class EstoqueModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<EstoqueController>((i) => EstoqueController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const EstoquePage(),
    ),
  ];
}
