import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/controllers/vendas_controller.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/selecao_cliente_page.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/selecao_pagamento_page.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/pages/vendas_page.dart';
import '../clientes/domain/repositories/clientes_repository_interface.dart';
import '../clientes/external/clientes_datasource_impl.dart';
import '../clientes/infra/datasources/clientes_datasource_interface.dart';
import '../clientes/infra/repositories/clientes_repository_impl.dart';
import '../estoque/domain/repositories/estoque_repository_interface.dart';
import '../estoque/external/estoque_datasource_impl.dart';
import '../estoque/infra/datasources/estoque_datasource_interface.dart';
import '../estoque/infra/repositories/estoque_repository_impl.dart';
import 'domain/repositories/vendas_repository_interface.dart';
import 'external/vendas_datasource_impl.dart';
import 'infra/datasources/vendas_datasource_interface.dart';
import 'infra/repositories/vendas_repository_impl.dart';

class VendasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<EstoqueDatasourceInterface>(
        (i) => EstoqueDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<EstoqueRepositoryInterface>(
        (i) => EstoqueRepositoryImpl(datasource: i())),
    Bind.lazySingleton<ClientesDatasourceInterface>(
        (i) => ClientesDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<ClientesRepositoryInterface>(
        (i) => ClientesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<VendasController>((i) => VendasController(
        clientesRepository: i(), estoqueRepository: i(), repository: i())),
    Bind.lazySingleton<VendasDatasourceInterface>(
        (i) => VendasDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<VendasRepositoryInterface>(
        (i) => VendasRepositoryImpl(datasource: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SelecaoClientePage(),
    ),
    ChildRoute(
      '/listarVenda',
      child: (context, args) => const VendasPage(),
    ),
    ChildRoute(
      '/pagamento',
      child: (context, args) => const SelecaoPagamentoPage(),
    ),
  ];
}
