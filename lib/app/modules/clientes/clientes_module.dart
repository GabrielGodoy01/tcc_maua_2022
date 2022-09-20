import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/clientes/external/busca_cep_datasource.dart';
import 'package:tcc_maua_2022/app/modules/clientes/external/clientes_datasource_impl.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/datasources/clientes_datasource_interface.dart';
import 'package:tcc_maua_2022/app/modules/clientes/presentation/controllers/clientes_controller.dart';
import 'package:tcc_maua_2022/app/modules/clientes/presentation/ui/clientes_page.dart';

import 'domain/repositories/clientes_repository_interface.dart';
import 'infra/repositories/clientes_repository_impl.dart';

class ClientesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ClientesController>(
        (i) => ClientesController(repository: i(), buscaCepDatasource: i())),
    Bind.lazySingleton<BuscaCepDatasource>((i) => BuscaCepDatasource(i())),
    Bind.lazySingleton<ClientesDatasourceInterface>(
        (i) => ClientesDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<ClientesRepositoryInterface>(
        (i) => ClientesRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const ClientesPage(),
    ),
  ];
}
