import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/widgets/venda_card_widget.dart';

import '../../../../../../shared/widgets/buttons/form_button_widget.dart';
import '../../../../../../shared/widgets/dialogs/custom_alert_dialog.dart';
import '../../../controllers/vendas/relatorios_vendas_controller.dart';

class RelatorioVendasPage extends StatelessWidget {
  const RelatorioVendasPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RelatoriosVendasController>();
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
                  'Relatório de Vendas',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Observer(builder: (_) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listaPanelVendas.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: VendaCardWidget(
                        custoFinal: controller
                            .listaPanelVendas[index].vendas.custoFinal,
                        titulo: controller
                            .listaPanelVendas[index].vendas.cliente.nome,
                        isOpen: controller.listaPanelVendas[index].isOpen,
                        venda: controller.listaPanelVendas[index].vendas,
                        onPressed: () {
                          controller.swapOpen(index);
                        },
                      ),
                    ),
                  ),
                );
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
