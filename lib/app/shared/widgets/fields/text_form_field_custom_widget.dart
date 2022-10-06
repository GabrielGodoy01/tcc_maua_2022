import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../domain/infra/tipo_campo_enum.dart';

class TextFormFieldCustomWidget extends StatefulWidget {
  final String? titulo;
  final bool needController;
  final void Function(String value)? onChanged;
  final bool isRequired;
  final String? value;
  final int size;
  final bool? isEnabled;
  final TipoCampoTextoEnum? tipoCampoTextoEnum;
  const TextFormFieldCustomWidget({
    Key? key,
    this.titulo,
    this.onChanged,
    this.isRequired = false,
    this.value,
    this.tipoCampoTextoEnum = TipoCampoTextoEnum.texto,
    required this.size,
    this.isEnabled = true,
    this.needController = true,
  }) : super(key: key);

  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = widget.needController
        ? TextEditingController(text: widget.value)
        : null;
    final maskTelefone = MaskTextInputFormatter(
        initialText: widget.value,
        mask: "(##) #####-####",
        filter: {"#": RegExp(r'[0-9]')});
    final maskCep = MaskTextInputFormatter(
        initialText: widget.value,
        mask: "#####-###",
        filter: {"#": RegExp(r'[0-9]')});
    final maskValor = CurrencyTextInputFormatter(
      locale: 'pt-br',
      decimalDigits: 2,
      symbol: 'R\$ ',
    );
    final maskRg = MaskTextInputFormatter(
        initialText: widget.value,
        mask: "##.###.###-##",
        filter: {"#": RegExp(r'[0-9]')});

    return SizedBox(
      width: widget.size == 0
          ? MediaQuery.of(context).size.width * 0.5
          : widget.size == 1
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.1,
      child: TextFormField(
        controller: controller,
        inputFormatters:
            widget.tipoCampoTextoEnum == TipoCampoTextoEnum.telefone
                ? [maskTelefone]
                : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.cep
                    ? [maskCep]
                    : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.valor
                        ? [maskValor]
                        : widget.tipoCampoTextoEnum == TipoCampoTextoEnum.rg
                            ? [maskRg]
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
