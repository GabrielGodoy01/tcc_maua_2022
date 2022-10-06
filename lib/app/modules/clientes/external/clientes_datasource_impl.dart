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
      telefones: ['(11) 99127-3092', '(11) 99127-3092', '(11) 99127-3092'],
      nome: 'Hector Guerrini',
      razaoSocial: '',
      cpf: '49846129831',
      nomeContato: 'Ronaldinho',
      rgContato: '55.019.963-9',
      email: 'gabriel.godoybz@hotmail.com',
      enderecoModel: EnderecoModel(
        bairro: 'Jardim São Caetano',
        cep: '09581-570',
        cidade: 'São Caetano do Sul',
        numero: '251',
        endereco: 'Rua Anchienta',
        estado: 'SP',
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
