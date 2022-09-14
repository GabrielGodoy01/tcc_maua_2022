import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/estoque_module.dart';
import 'package:tcc_maua_2022/app/shared/services/estoque_options.dart';

import 'modules/clientes/clientes_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => Dio(estoqueOption))];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/estoque', module: EstoqueModule()),
    ModuleRoute('/clientes', module: ClientesModule()),
  ];
}
