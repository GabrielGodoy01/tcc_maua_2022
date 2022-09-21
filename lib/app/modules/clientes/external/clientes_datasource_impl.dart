import 'package:dio/dio.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/endereco_model.dart';

import '../infra/datasources/clientes_datasource_interface.dart';
import '../infra/model/clientes_model.dart';

class ClientesDatasourceImpl extends ClientesDatasourceInterface {
  final Dio dioClient;

  ClientesDatasourceImpl({required this.dioClient});

  List<ClientesModel> clientes = [
    ClientesModel(
      idCliente: 0,
      telefones: ['11991273092'],
      nome: 'Hector Ronaldinho',
      razaoSocial: 'razão social',
      cpf: '',
      nomeContato: 'nomeContato',
      rgContato: 'rgContato',
      email: 'email',
      enderecoModel: EnderecoModel(
        bairro: '',
        cep: '',
        cidade: '',
      ),
    )
  ];

  @override
  Future postItem(ClientesModel item) async {
    // dio post implementation
    clientes.add(item);
  }

  @override
  Future putItem(ClientesModel item) async {
    // dio put implementation
    clientes.add(item);
  }

  @override
  Future<List<ClientesModel>> getAllItems() {
    // dio get all implementation
    return Future.value(clientes);
  }
}
