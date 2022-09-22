import 'package:flutter/material.dart';

import '../../../../../../shared/widgets/fields/drop_down_field_custom_widget.dart';
import '../../../../../../shared/widgets/fields/text_form_field_custom_widget.dart';
import '../../../../../estoque/infra/model/estoque_model.dart';

class RowEditavelWidth extends StatelessWidget {
  final Function(EstoqueModel?)? onChangedDescricao;
  final List<DropdownMenuItem<EstoqueModel>> items;
  final Function(String)? onChangedQuantidade;
  final String? quantidade;
  final String custoFinal;
  final Widget button;
  const RowEditavelWidth(
      {super.key,
      this.onChangedDescricao,
      required this.items,
      this.onChangedQuantidade,
      this.quantidade,
      required this.custoFinal,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropDownFieldCustomWidget<EstoqueModel>(
            size: 500, onChanged: onChangedDescricao, items: items),
        const SizedBox(
          width: 64,
        ),
        TextFormFieldCustomWidget(
          size: 2,
          onChanged: onChangedQuantidade,
          isRequired: true,
          isNumber: true,
          value: quantidade,
        ),
        const SizedBox(
          width: 64,
        ),
        Text(
          custoFinal,
          style: const TextStyle(fontSize: 22),
        ),
        const Spacer(),
        button,
      ],
    );
  }
}
