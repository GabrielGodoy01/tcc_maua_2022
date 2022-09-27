import 'package:flutter/material.dart';
import '../../../../../vendas/domain/infra/tipo_pagamento_enum.dart';
import '../../../../../vendas/infra/model/vendas_model.dart';

class VendaCardWidget extends StatelessWidget {
  final String titulo;
  final bool isOpen;
  final VendasModel venda;
  final double custoFinal;
  final Function()? onPressed;

  const VendaCardWidget(
      {Key? key,
      required this.titulo,
      required this.isOpen,
      this.onPressed,
      required this.venda,
      required this.custoFinal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionPanelList(
        animationDuration: const Duration(seconds: 1),
        elevation: 4,
        children: [
          ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: isOpen,
              headerBuilder: (context, isExpanded) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          titulo,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
              body: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8, bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                'Descrição',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Quantidade',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Custo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                        venda.listaItensVenda.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 10,
                                ),
                              )
                            : ListView.builder(
                                itemCount: venda.listaItensVenda.length,
                                shrinkWrap: true,
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
                                                venda.listaItensVenda[index]
                                                    .estoque.descricao,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                venda.listaItensVenda[index]
                                                    .quantidade
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'R\$ ${venda.listaItensVenda[index].custoFinal!.toStringAsFixed(2).replaceAll('.', ',')}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Text(
                                'Final:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: venda.tipoPagamento != null
                                  ? Text(
                                      venda.tipoPagamento!.nome,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Expanded(
                              child: Text(
                                'R\$ ${custoFinal.toStringAsFixed(2).replaceAll('.', ',')}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              )),
        ],
        expansionCallback: (i, isExpanded) {
          onPressed!();
        },
      ),
    );
  }
}
