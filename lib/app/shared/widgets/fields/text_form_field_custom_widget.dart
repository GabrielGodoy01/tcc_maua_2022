import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import '../../domain/infra/tipo_campo_enum.dart';

class TextFormFieldCustomWidget extends StatefulWidget {
  final String? titulo;
  final void Function(String value)? onChanged;
  final bool isRequired;
  final String? value;
  final bool isNumber;
  final int size;
  final bool? isEnabled;
  final TipoCampoTextoEnum? tipoCampoTextoEnum;
  const TextFormFieldCustomWidget({
    Key? key,
    this.titulo,
    this.onChanged,
    this.isRequired = false,
    this.isNumber = false,
    this.value,
    this.tipoCampoTextoEnum = TipoCampoTextoEnum.texto,
    required this.size,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = widget.tipoCampoTextoEnum == TipoCampoTextoEnum.valor
        ? MoneyMaskedTextController(
            decimalSeparator: ',',
            precision: 2,
            leftSymbol: 'R\$',
            initialValue: double.tryParse(widget.value ?? ''))
        : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.numero
            ? MoneyMaskedTextController(
                precision: 0,
                decimalSeparator: '',
                initialValue: double.tryParse(widget.value ?? ''))
            : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.double
                ? MoneyMaskedTextController(
                    decimalSeparator: ',',
                    precision: 2,
                    initialValue: double.tryParse(widget.value ?? ''))
                : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.telefone
                    ? MaskedTextController(
                        mask: '(00) 00000-0000',
                        text: widget.value,
                        cursorBehavior: CursorBehaviour.end)
                    : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.cep
                        ? MaskedTextController(
                            mask: '00000-000',
                            text: widget.value,
                            cursorBehavior: CursorBehaviour.end,
                          )
                        : TextEditingController(text: widget.value);

    return SizedBox(
      width: widget.size == 0
          ? MediaQuery.of(context).size.width * 0.5
          : widget.size == 1
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.1,
      child: TextFormField(
        validator: (value) {
          if (widget.isRequired && (value == null || value.isEmpty)) {
            return 'Este campo é obrigatório';
          }
          return null;
        },
        controller: controller,
        keyboardType: widget.isNumber ? TextInputType.number : null,
        inputFormatters: widget.isNumber
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        onChanged: widget.onChanged,
        enabled: widget.isEnabled,
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: widget.titulo,
          labelStyle: const TextStyle(
            fontSize: 24,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
