import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../buttons/form_button_widget.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function()? onPressed;
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.buttonTitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
      content: FormButtonWidget(
        backgroundColor: Colors.blue,
        icon: Icons.check,
        titulo: buttonTitle,
        onPressed: onPressed ??
            () {
              Modular.to.pop();
            },
      ),
    );
  }
}
