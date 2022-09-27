import 'package:flutter/material.dart';

import '../../../../../../vendas/infra/model/estoque_venda_model.dart';

class VendaCardWidget extends StatelessWidget {
  final String titulo;
  final bool isOpen;
  final List<EstoqueVendaModel> listaVendas;
  final double custoFinal;
  final Function()? onPressed;

  const VendaCardWidget(
      {Key? key,
      required this.titulo,
      required this.isOpen,
      this.onPressed,
      required this.listaVendas,
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
                        listaVendas.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 10,
                                ),
                              )
                            : ListView.builder(
                                itemCount: listaVendas.length,
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
                                                listaVendas[index]
                                                    .estoque
                                                    .descricao,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                listaVendas[index]
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
                                                'R\$ ${listaVendas[index].custoFinal!.toStringAsFixed(2).replaceAll('.', ',')}',
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
                            const Expanded(child: SizedBox.shrink()),
                            const Expanded(child: SizedBox.shrink()),
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
