import 'package:mobx/mobx.dart';
import '../../domain/repositories/estoque_repository_interface.dart';
import '../../infra/model/estoque_model.dart';

part 'estoque_controller.g.dart';

class EstoqueController = EstoqueControllerBase with _$EstoqueController;

abstract class EstoqueControllerBase with Store {
  final EstoqueRepositoryInterface repository;
  EstoqueControllerBase(this.repository) {
    obterTodosEstoque();
  }

  @observable
  List<EstoqueModel> listaItensEstoque = [];

  @observable
  EstoqueModel estoque = EstoqueModel.newInstance();

  @action
  Future obterTodosEstoque() async {
    listaItensEstoque = await repository.obterTodosEstoques();
  }

  @action
  void setDescricao(String value) {
    estoque = estoque.copyWith(descricao: value);
  }

  @action
  void setLocalizacao(String value) {
    estoque = estoque.copyWith(localizacao: value);
  }

  @action
  void setQuantidade(int value) {
    estoque = estoque.copyWith(quantidade: value);
  }

  @action
  void setEstoqueMinimo(int value) {
    estoque = estoque.copyWith(estoqueMinimo: value);
  }

  @action
  void setEstoqueMaximo(int value) {
    estoque = estoque.copyWith(estoqueMaximo: value);
  }

  @action
  void setCusto(double value) {
    estoque = estoque.copyWith(custo: value);
  }

  @action
  void setEstoque(int id) {
    estoque =
        listaItensEstoque.firstWhere((element) => element.idEstoque == id);
  }

  @action
  void selectEstoque(EstoqueModel estoqueToChange) {
    estoque = estoqueToChange;
  }

  @action
  Future<void> salvarItem() async {
    if (estoque.idEstoque != null) {
      await repository.alterarItem(estoque);
    } else {
      await repository.criarNovoItem(estoque);
      limparTexto();
    }
  }

  @action
  void limparTexto() {
    estoque = EstoqueModel.newInstance();
  }
}
