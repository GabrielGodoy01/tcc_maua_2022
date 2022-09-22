import 'package:flutter/material.dart';

class RowEstaticaWidget extends StatelessWidget {
  final String custoFinal;
  final String descricao;
  final String quantidade;
  final Widget button;
  const RowEstaticaWidget(
      {super.key,
      required this.custoFinal,
      required this.descricao,
      required this.quantidade,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 500,
          child: Text(
            descricao,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 64,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: Text(
            quantidade,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 64,
        ),
        Text(
          custoFinal,
          style: const TextStyle(fontSize: 22),
        ),
        const Spacer(),
        button
      ],
    );
  }
}
