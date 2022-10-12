import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:tcc_maua_2022/app/app_module.dart';
import 'package:tcc_maua_2022/app/modules/clientes/clientes_module.dart';
import 'package:tcc_maua_2022/app/modules/clientes/domain/repositories/clientes_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/clientes/external/busca_cep_datasource.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/datasources/clientes_datasource_interface.dart';
import 'package:tcc_maua_2022/app/modules/clientes/presentation/controllers/clientes_controller.dart';
import 'package:tcc_maua_2022/app/modules/landing/landing_module.dart';

void main() {
  initModules([
    ClientesModule(),
    AppModule(),
    LandingModule(),
  ]);

  test('ClientesController Injection', () {
    Modular.get<ClientesController>();
  });

  test('BuscaCepDatasource Injection', () {
    Modular.get<BuscaCepDatasource>();
  });

  test('ClientesDatasourceInterface Injection', () {
    Modular.get<ClientesDatasourceInterface>();
  });

  test('ClientesRepositoryInterface Injection', () {
    Modular.get<ClientesRepositoryInterface>();
  });
}
