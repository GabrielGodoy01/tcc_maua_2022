import 'package:flutter/material.dart';

class RelatoriosButtonWidget extends StatelessWidget {
  final String nomeRelatorio;
  final IconData icon;
  final Function()? onPressed;
  const RelatoriosButtonWidget(
      {super.key,
      required this.nomeRelatorio,
      required this.icon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 170,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 28),
              elevation: 10,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 60,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                nomeRelatorio,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}
