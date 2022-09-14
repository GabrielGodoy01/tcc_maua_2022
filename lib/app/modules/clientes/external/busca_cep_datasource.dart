import 'dart:developer';

import 'package:dio/dio.dart';

import '../infra/model/resultado_busca_cep_model.dart';

class BuscaCepDatasource {
  final Dio dio;

  BuscaCepDatasource(this.dio);

  Future<ResultadoBuscaCepModel> getCepExterno(String cep) async {
    try {
      var response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      var endereco =
          ResultadoBuscaCepModel.fromMap(response.data as Map<String, dynamic>);
      return endereco;
    } on DioError catch (error) {
      log('erro: ${error.response!.statusCode}');
      return ResultadoBuscaCepModel(
        bairro: '',
        cep: '',
        localidade: '',
        logradouro: '',
        uf: '',
      );
    }
  }
}
