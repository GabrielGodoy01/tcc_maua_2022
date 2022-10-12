import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:tcc_maua_2022/app/app_module.dart';
import 'package:tcc_maua_2022/app/modules/estoque/domain/repositories/estoque_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/estoque_module.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/datasources/estoque_datasource_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/controllers/estoque_controller.dart';
import 'package:tcc_maua_2022/app/modules/landing/landing_module.dart';

void main() {
  initModules([
    EstoqueModule(),
    AppModule(),
    LandingModule(),
  ]);

  test('EstoqueController Injection', () {
    Modular.get<EstoqueController>();
  });

  test('EstoqueDatasourceInterface Injection', () {
    Modular.get<EstoqueDatasourceInterface>();
  });

  test('EstoqueRepositoryInterface Injection', () {
    Modular.get<EstoqueRepositoryInterface>();
  });
}
