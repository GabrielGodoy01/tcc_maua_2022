import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/orcamento/relatorios_orcamento_controller.dart';
import '../widgets/venda_card_widget.dart';

class RelatorioOrcamentoPage extends StatelessWidget {
  const RelatorioOrcamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RelatoriosOrcamentoController>();
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
                  'Relatório de Orçamentos',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Observer(builder: (_) {
                return Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listaPanelOrcamentos.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: VendaCardWidget(
                        custoFinal: controller
                            .listaPanelOrcamentos[index].vendas.custoFinal,
                        titulo: controller
                            .listaPanelOrcamentos[index].vendas.cliente.nome,
                        isOpen: controller.listaPanelOrcamentos[index].isOpen,
                        venda: controller.listaPanelOrcamentos[index].vendas,
                        onPressed: () {
                          controller.swapOpen(index);
                        },
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
