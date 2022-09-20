import 'package:mobx/mobx.dart';
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
    ),
    EstoqueModel(
      quantidade: 10,
      descricao: 'descricao',
      estoqueMinimo: 10,
      estoqueMaximo: 10,
      custo: 100,
      idEstoque: 0,
      localizacao: 'localizacao',
    ),
  ];

  @observable
  EstoqueModel estoque = EstoqueModel.newInstance();

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
  Future<void> salvarItem() async {
    if (estoque.idEstoque != null) {
      await repository.alterarItem(estoque);
    } else {
      await repository.criarNovoItem(estoque);
    }
  }

  @action
  void limparTexto() {
    estoque = EstoqueModel.newInstance();
  }
}
