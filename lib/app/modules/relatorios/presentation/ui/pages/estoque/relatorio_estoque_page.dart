import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/controllers/estoque/relatorios_estoque_controller.dart';

import '../../../../../../shared/widgets/buttons/form_button_widget.dart';
import '../../../../../../shared/widgets/dialogs/custom_alert_dialog.dart';

class RelatorioEstoquePage extends StatelessWidget {
  const RelatorioEstoquePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RelatoriosEstoqueController>();
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Relatório de Estoque',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      'Descrição',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Quantidade',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Estoque Mín.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Estoque Máx.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Custo Un.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Localização',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                color: Colors.black,
              ),
              Observer(builder: (_) {
                return Expanded(
                    child: controller.listaItensEstoque.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 10,
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.listaItensEstoque.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller.listaItensEstoque[index]
                                                .descricao,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.listaItensEstoque[index]
                                                .quantidade
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.listaItensEstoque[index]
                                                .estoqueMinimo
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.listaItensEstoque[index]
                                                .estoqueMaximo
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'R\$ ${controller.listaItensEstoque[index].custo.toStringAsFixed(2).replaceAll('.', ',')}',
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.listaItensEstoque[index]
                                                    .localizacao ??
                                                '...',
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              );
                            },
                          ));
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: FormButtonWidget(
                  icon: Icons.download,
                  titulo: 'Baixar Relatório',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomAlertDialog(
                          buttonTitle: 'Entendido',
                          title: 'Ainda em produção!',
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
