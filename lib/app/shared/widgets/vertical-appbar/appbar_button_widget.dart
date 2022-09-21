import 'package:flutter/material.dart';

class VerticalNavbarButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final int indexToShow;
  final int myIndex;
  final String buttonText;
  final IconData icon;
  const VerticalNavbarButtonWidget({
    Key? key,
    this.onPressed,
    required this.indexToShow,
    required this.buttonText,
    required this.icon,
    required this.myIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: indexToShow == myIndex ? Colors.grey.shade700 : Colors.white,
            size: 55,
          ),
          Text(
            buttonText,
            style: TextStyle(
              color:
                  indexToShow == myIndex ? Colors.grey.shade700 : Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
