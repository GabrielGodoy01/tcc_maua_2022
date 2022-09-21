import 'package:mobx/mobx.dart';
import 'package:tcc_maua_2022/app/modules/clientes/domain/repositories/clientes_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/domain/repositories/estoque_repository_interface.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';
import 'package:tcc_maua_2022/app/modules/vendas/domain/repositories/vendas_repository_interface.dart';

import '../../../clientes/infra/model/clientes_model.dart';
import '../../infra/model/estoque_venda_model.dart';
import '../../infra/model/vendas_model.dart';

part 'vendas_controller.g.dart';

class VendasController = VendasControllerBase with _$VendasController;

abstract class VendasControllerBase with Store {
  final VendasRepositoryInterface repository;
  final EstoqueRepositoryInterface estoqueRepository;
  final ClientesRepositoryInterface clientesRepository;

  VendasControllerBase({
    required this.repository,
    required this.estoqueRepository,
    required this.clientesRepository,
  }) {
    init();
  }

  @observable
  var venda = VendasModel.newInstance();

  @observable
  var composicao = EstoqueVendaModel.newInstance();

  @observable
  var listaClientesCadastrados = <ClientesModel>[];

  @observable
  var listaEstoqueCadastrados = <EstoqueModel>[];

  @action
  Future init() async {
    listaClientesCadastrados = await clientesRepository.obterTodosClientes();
    listaEstoqueCadastrados = await estoqueRepository.obterTodosEstoques();
  }

  @action
  void setCliente(ClientesModel clientesModel) {
    venda = venda.copyWith(cliente: clientesModel);
  }

  @action
  void setItemEstoque(EstoqueModel estoque) {
    composicao = composicao.copyWith(estoque: estoque);
  }

  @action
  void setQuantidade(int quantidade) {
    composicao = composicao.copyWith(quantidade: quantidade);
  }

  @action
  void setCustoFinal() {
    var custoFinal = composicao.quantidade * composicao.estoque.custo;
    composicao = composicao.copyWith(custoFinal: custoFinal);
  }

  @action
  void adicionarComposicao() {
    if (composicao.estoque.descricao != '' && composicao.quantidade != 0) {
      var lista = List<EstoqueVendaModel>.from(venda.listaItensVenda);
      lista.add(composicao);
      venda = venda.copyWith(listaItensVenda: lista);
    }
  }

  @action
  void removerComposicao(int index) {
    var lista = List<EstoqueVendaModel>.from(venda.listaItensVenda);
    lista.removeAt(index);
    venda = venda.copyWith(listaItensVenda: lista);
  }
}
