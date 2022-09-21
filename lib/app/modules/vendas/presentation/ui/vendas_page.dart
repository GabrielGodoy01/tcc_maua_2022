import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';

import '../../../../shared/widgets/fields/drop_down_field_custom_widget.dart';
import '../../../../shared/widgets/fields/text_form_field_custom_widget.dart';
import '../controllers/vendas_controller.dart';

class VendasPage extends StatelessWidget {
  const VendasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<VendasController>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Cadastro de Vendas',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Descrição',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Quantidade',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Custo Final',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Observer(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.venda.listaItensVenda.length + 1,
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DropDownFieldCustomWidget<EstoqueModel>(
                              onChanged: (value) {
                                controller.setItemEstoque(value!);
                              },
                              items: controller.listaEstoqueCadastrados
                                  .map((EstoqueModel value) {
                                return DropdownMenuItem<EstoqueModel>(
                                  value: value,
                                  child: Text(value.descricao),
                                );
                              }).toList(),
                            ),
                            TextFormFieldCustomWidget(
                              size: 1,
                              titulo: 'Quantidade',
                              onChanged: (value) {
                                controller.setQuantidade(int.parse(value));
                                controller.setCustoFinal();
                              },
                              isRequired: true,
                              isNumber: true,
                              value:
                                  controller.composicao.quantidade.toString(),
                            ),
                            Observer(builder: (_) {
                              return Text(
                                  controller.composicao.custoFinal.toString());
                            }),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 24),
                                    elevation: 10,
                                    backgroundColor: controller
                                                .venda.listaItensVenda.length ==
                                            index
                                        ? Colors.blue
                                        : Colors.red,
                                  ),
                                  onPressed: () {
                                    controller.venda.listaItensVenda.length ==
                                            index
                                        ? controller.adicionarComposicao()
                                        : controller.removerComposicao(index);
                                  },
                                  child:
                                      controller.venda.listaItensVenda.length ==
                                              index
                                          ? const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 24.0,
                                            )
                                          : const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 24.0,
                                            )),
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
