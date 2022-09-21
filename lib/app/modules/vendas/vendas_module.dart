import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/vendas_page.dart';

class VendasModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const VendasPage(),
    ),
  ];
}
