import 'package:tcc_maua_2022/app/modules/vendas/infra/model/vendas_model.dart';

import '../../domain/repositories/orcamento_repository_interface.dart';
import '../datasources/orcamento_datasource_interface.dart';

class OrcamentoRepositoryImpl implements OrcamentoRepositoryInterface {
  final OrcamentoDatasourceInterface datasource;

  OrcamentoRepositoryImpl({required this.datasource});

  @override
  Future<List<VendasModel>> obterTodosOrcamentos() async {
    return await datasource.getOrcamentos();
  }

  @override
  Future<void> registrarOrcamento(VendasModel venda) async {
    await datasource.postOrcamento(venda);
  }
}
