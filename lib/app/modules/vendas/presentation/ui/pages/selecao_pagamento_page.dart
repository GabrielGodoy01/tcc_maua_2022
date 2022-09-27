import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/widgets/buttons/form_button_widget.dart';
import '../../../../../shared/widgets/dialogs/custom_alert_dialog.dart';
import '../../../../../shared/widgets/fields/drop_down_field_custom_widget.dart';
import '../../../domain/infra/tipo_pagamento_enum.dart';
import '../../controllers/vendas_controller.dart';

class SelecaoPagamentoPage extends StatelessWidget {
  const SelecaoPagamentoPage({super.key});

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
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Cadastro de Venda',
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Escolha o método de pagamento da venda:',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    DropDownFieldCustomWidget<TipoPagamentoEnum>(
                      size: double.infinity,
                      onChanged: (value) {
                        controller.setPagamento(value!);
                      },
                      items: TipoPagamentoEnum.values
                          .map((TipoPagamentoEnum value) {
                        return DropdownMenuItem<TipoPagamentoEnum>(
                          value: value,
                          child: Text(value.nome),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FormButtonWidget(
                        icon: Icons.check,
                        titulo: 'Continuar',
                        onPressed: () {
                          if (controller.venda.tipoPagamento != null) {
                            controller.realizarVenda();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomAlertDialog(
                                  buttonTitle: 'Ok',
                                  title: 'A venda foi realizada!',
                                );
                              },
                            );
                            Modular.to.navigate('/vendas/');
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomAlertDialog(
                                  buttonTitle: 'Entendido',
                                  title:
                                      'É necessário selecionar um método de pagamento!',
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
