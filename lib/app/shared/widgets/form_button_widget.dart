import 'package:flutter/material.dart';

class FormButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final String titulo;
  final Color? backgroundColor;
  const FormButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.titulo,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: const TextStyle(fontSize: 24),
          elevation: 10,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 24.0,
        ),
        onPressed: onPressed,
        label: Text(titulo),
      ),
    );
  }
}
