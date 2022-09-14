import 'package:mobx/mobx.dart';

import '../../domain/infra/unidade_estoque_enum.dart';
import '../../domain/repositories/estoque_repository_interface.dart';
import '../../infra/model/estoque_model.dart';

part 'estoque_controller.g.dart';

class EstoqueController = EstoqueControllerBase with _$EstoqueController;

abstract class EstoqueControllerBase with Store {
  final EstoqueRepositoryInterface repository;
  EstoqueControllerBase(this.repository);

  @observable
  List<EstoqueModel> listaItensEstoque = [
    EstoqueModel(
      quantidade: 10,
      descricao:
          'descricaodescricaodescricaodescricaodescricaodescricaodescricaodescricao',
      estoqueMinimo: 10,
      estoqueMaximo: 10,
      custo: 100,
      idEstoque: 0,
      localizacao: 'localizacao',
      unidadeItem: UnidadeItemEnum.linear,
    ),
    EstoqueModel(
      quantidade: 10,
      descricao: 'descricao',
      estoqueMinimo: 10,
      estoqueMaximo: 10,
      custo: 100,
      idEstoque: 0,
      localizacao: 'localizacao',
      unidadeItem: UnidadeItemEnum.linear,
    ),
  ];

  @observable
  EstoqueModel item = EstoqueModel.newInstance();

  @action
  void setDescricao(String value) {
    item = item.copyWith(descricao: value);
  }

  @action
  void setLocalizacao(String value) {
    item = item.copyWith(localizacao: value);
  }

  @action
  void setUnidade(UnidadeItemEnum? value) {
    item = item.copyWith(unidadeItem: value);
  }

  @action
  void setQuantidade(int value) {
    item = item.copyWith(quantidade: value);
  }

  @action
  void setEstoqueMinimo(int value) {
    item = item.copyWith(estoqueMinimo: value);
  }

  @action
  void setEstoqueMaximo(int value) {
    item = item.copyWith(estoqueMaximo: value);
  }

  @action
  void setCusto(double value) {
    item = item.copyWith(custo: value);
  }

  @action
  void setEstoque(int id) {
    item = listaItensEstoque.firstWhere((element) => element.idEstoque == id);
  }

  @action
  Future<void> salvarItem() async {
    await repository.salvarItem(item);
  }

  @action
  void limparTexto() {
    item = EstoqueModel.newInstance();
  }

  @action
  void selectProduto(int id) {
    item = listaItensEstoque.firstWhere((element) => element.idEstoque == id);
  }
}
