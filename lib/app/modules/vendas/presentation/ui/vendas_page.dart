import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/widgets/rows/row_editavel_widget.dart';
import 'package:tcc_maua_2022/app/modules/vendas/presentation/ui/widgets/rows/row_estatica_widget.dart';
import 'package:tcc_maua_2022/app/shared/widgets/dialogs/custom_alert_dialog.dart';

import '../../../../shared/widgets/buttons/form_button_widget.dart';
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 500,
                        child: Text(
                          'Descrição',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 64,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: const Text(
                          'Quantidade',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 64,
                      ),
                      const Text(
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
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Observer(builder: (_) {
                              return controller.venda.listaItensVenda.length ==
                                      index
                                  ? RowEditavelWidth(
                                      onChangedDescricao: (value) {
                                        controller.setItemEstoque(value!);
                                      },
                                      items: controller.listaEstoqueCadastrados
                                          .map((EstoqueModel value) {
                                        return DropdownMenuItem<EstoqueModel>(
                                          value: value,
                                          child: Text(value.descricao),
                                        );
                                      }).toList(),
                                      quantidade: controller
                                          .composicao.quantidade
                                          .toString(),
                                      onChangedQuantidade: (value) {
                                        controller
                                            .setQuantidade(int.parse(value));
                                        controller.setCustoFinal(index);
                                      },
                                      custoFinal: controller.listaCustos.isEmpty
                                          ? 'R\$ 0,00'
                                          : 'R\$ ${controller.listaCustos[index]!.toStringAsFixed(2).replaceAll('.', ',')}',
                                      button: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 24),
                                              elevation: 10,
                                              backgroundColor: controller
                                                          .venda
                                                          .listaItensVenda
                                                          .length ==
                                                      index
                                                  ? Colors.blue
                                                  : Colors.red,
                                            ),
                                            onPressed: () {
                                              controller.venda.listaItensVenda
                                                          .length ==
                                                      index
                                                  ? controller
                                                      .adicionarComposicao()
                                                  : controller
                                                      .removerComposicao(index);
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 24.0,
                                            )),
                                      ),
                                    )
                                  : RowEstaticaWidget(
                                      custoFinal:
                                          'R\$ ${controller.venda.listaItensVenda[index].custoFinal!.toStringAsFixed(2).replaceAll('.', ',')}',
                                      descricao: controller
                                          .venda
                                          .listaItensVenda[index]
                                          .estoque
                                          .descricao,
                                      quantidade: controller.venda
                                          .listaItensVenda[index].quantidade
                                          .toString(),
                                      button: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            textStyle:
                                                const TextStyle(fontSize: 24),
                                            elevation: 10,
                                            backgroundColor: controller
                                                        .venda
                                                        .listaItensVenda
                                                        .length ==
                                                    index
                                                ? Colors.blue
                                                : Colors.red,
                                          ),
                                          onPressed: () {
                                            controller.venda.listaItensVenda
                                                        .length ==
                                                    index
                                                ? controller
                                                    .adicionarComposicao()
                                                : controller
                                                    .removerComposicao(index);
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    );
                            })),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Observer(builder: (_) {
                        return Text(
                          'Total: R\$ ${controller.getTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        );
                      }),
                      const SizedBox(
                        width: 32,
                      ),
                      FormButtonWidget(
                        icon: Icons.check,
                        titulo: 'Confirmar',
                        onPressed: () {
                          if (controller.venda.listaItensVenda.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => const CustomAlertDialog(
                                  title: 'Adicione pelo menos um produto',
                                  buttonTitle: 'Entendido'),
                            );
                          } else {
                            controller.realizarVenda();
                            Modular.to.navigate('/vendas');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
