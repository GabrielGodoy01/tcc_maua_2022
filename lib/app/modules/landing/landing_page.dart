import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/shared/widgets/vertical-appbar/vertical_appbar_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: const [
          VerticalAppbarWidget(),
          Flexible(
            child: Center(
              child: SizedBox(child: RouterOutlet()),
            ),
          ),
        ],
      ),
    );
  }
}
