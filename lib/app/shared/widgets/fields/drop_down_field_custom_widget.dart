import 'package:flutter/material.dart';

class DropDownFieldCustomWidget<T> extends StatelessWidget {
  final String? titulo;
  final void Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final bool isRequired;
  final double? size;

  final T? value;
  const DropDownFieldCustomWidget({
    Key? key,
    this.titulo,
    this.value,
    this.isRequired = false,
    this.onChanged,
    required this.items,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 200,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          validator: (value) {
            if (isRequired && (value == null)) {
              return 'Este campo é obrigatório';
            }
            return null;
          },
          value: value,
          isExpanded: true,
          onChanged: onChanged,
          items: items,
          style: const TextStyle(
            fontSize: 24,
          ),
          decoration: InputDecoration(
            labelText: titulo,
            labelStyle: const TextStyle(
              fontSize: 24,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 22.5),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
