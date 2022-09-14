import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import '../../domain/infra/tipo_campo_enum.dart';

class TextFormFieldCustomWidget extends StatelessWidget {
  final String? titulo;
  final TextInputFormatter? textInputFormatter;
  final void Function(String value)? onChanged;
  final bool isRequired;
  final String? value;
  final bool isNumber;
  final int size;
  final TipoCampoTextoEnum tipoCampoTextoEnum;
  const TextFormFieldCustomWidget(
      {Key? key,
      this.titulo,
      this.onChanged,
      this.isRequired = false,
      this.isNumber = false,
      this.value,
      this.textInputFormatter,
      this.tipoCampoTextoEnum = TipoCampoTextoEnum.texto,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = tipoCampoTextoEnum == TipoCampoTextoEnum.valor
        ? MoneyMaskedTextController(
            decimalSeparator: ',',
            precision: 2,
            leftSymbol: 'R\$',
            initialValue: double.tryParse(value ?? ''))
        : tipoCampoTextoEnum == TipoCampoTextoEnum.numero
            ? MoneyMaskedTextController(
                precision: 0,
                decimalSeparator: '',
                initialValue: double.tryParse(value ?? ''))
            : tipoCampoTextoEnum == TipoCampoTextoEnum.double
                ? MoneyMaskedTextController(
                    decimalSeparator: ',',
                    precision: 2,
                    initialValue: double.tryParse(value ?? ''))
                : tipoCampoTextoEnum == TipoCampoTextoEnum.telefone
                    ? MaskedTextController(
                        mask: '(00) 00000-0000',
                        text: value,
                        cursorBehavior: CursorBehaviour.end)
                    : tipoCampoTextoEnum == TipoCampoTextoEnum.cpf
                        ? MaskedTextController(
                            mask: '000.000.000-00',
                            text: value,
                            cursorBehavior: CursorBehaviour.end,
                          )
                        : TextEditingController(text: value);

    return SizedBox(
      width: size == 0
          ? MediaQuery.of(context).size.width * 0.5
          : size == 1
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.1,
      child: TextFormField(
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'Este campo é obrigatório';
          }
          return null;
        },
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : null,
        inputFormatters: isNumber
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : (textInputFormatter != null ? [textInputFormatter!] : null),
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: titulo,
          labelStyle: const TextStyle(
            fontSize: 24,
          ),
          suffixIcon: IconButton(
              onPressed: controller.clear, icon: const Icon(Icons.close)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}