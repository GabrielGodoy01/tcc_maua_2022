import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/domain/repositories/estoque_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/external/estoque_datasource_impl.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/datasources/estoque_datasource_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/repositories/estoque_repository_impl.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/controllers/estoque_controller.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/ui/estoque/estoque_page.dart';

class EstoqueModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<EstoqueController>((i) => EstoqueController(i())),
    Bind.lazySingleton<EstoqueDatasourceInterface>(
        (i) => EstoqueDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const EstoquePage(),
    ),
  ];
}
