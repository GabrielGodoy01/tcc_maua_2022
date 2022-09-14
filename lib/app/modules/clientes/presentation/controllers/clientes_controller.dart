import 'package:mobx/mobx.dart';

import '../../domain/repositories/clientes_repository_interface.dart';
import '../../external/busca_cep_datasource.dart';
import '../../infra/model/clientes_model.dart';
import '../../infra/model/endereco_model.dart';
import '../../infra/model/resultado_busca_cep_model.dart';

part 'clientes_controller.g.dart';

class ClientesController = ClientesControllerBase with _$ClientesController;

abstract class ClientesControllerBase with Store {
  final ClientesRepositoryInterface repository;
  final BuscaCepDatasource buscaCepDatasource;

  ClientesControllerBase(
      {required this.buscaCepDatasource, required this.repository});

  @observable
  ClientesModel cliente = ClientesModel.newInstance();

  @observable
  ResultadoBuscaCepModel enderecoCliente = ResultadoBuscaCepModel.newInstance();

  @observable
  EnderecoModel endereco = EnderecoModel.newInstance();

  @observable
  List<ClientesModel> listaClientes = [];

  @action
  Future<void> procuraCep(String cep) async {
    enderecoCliente = await buscaCepDatasource.getCepExterno(cep);
    endereco = cliente.enderecoModel;
    endereco = endereco.copyWith(
        bairro: enderecoCliente.bairro,
        cep: enderecoCliente.cep,
        cidade: enderecoCliente.localidade,
        endereco: enderecoCliente.logradouro,
        estado: enderecoCliente.uf);
    cliente = cliente.copyWith(enderecoModel: endereco);
  }

  @action
  void setNome(String nome) {
    cliente = cliente.copyWith(nome: nome);
  }

  @action
  void setRazaoSocial(String razaoSocial) {
    cliente = cliente.copyWith(razaoSocial: razaoSocial);
  }

  @action
  void setCpf(String cpf) {
    cliente = cliente.copyWith(cpf: cpf);
  }

  @action
  void setEmail(String email) {
    cliente = cliente.copyWith(email: email);
  }

  @action
  void setTelefone1(String telefone1) {
    cliente.telefones.removeAt(0);
    cliente.telefones.insert(0, telefone1);
  }

  @action
  void setTelefone2(String telefone2) {
    cliente.telefones.removeAt(1);
    cliente.telefones.insert(1, telefone2);
  }

  @action
  void setTelefone3(String telefone3) {
    cliente.telefones.removeAt(2);
    cliente.telefones.insert(2, telefone3);
  }

  @action
  void setNomeContato(String nomeContato) {
    cliente = cliente.copyWith(nomeContato: nomeContato);
  }

  @action
  void setRgContato(String rgContato) {
    cliente = cliente.copyWith(rgContato: rgContato);
  }

  @action
  void setCep(String cep) {
    enderecoCliente = enderecoCliente.copyWith(cep: cep);
  }

  @action
  void setNumero(String numero) {
    cliente =
        cliente.copyWith(enderecoModel: endereco.copyWith(numero: numero));
  }

  @action
  void setComplemento(String? complemento) {
    cliente = cliente.copyWith(
        enderecoModel: endereco.copyWith(complemento: complemento));
  }

  @action
  Future<void> salvarCliente() async {
    if (cliente.idCliente != null) {
      await repository.salvarItem(cliente);
    }
  }
}