import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/widgets/buttons/relatorios_button_widget.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RelatoriosButtonWidget(
          nomeRelatorio: 'Estoque',
          icon: Icons.grid_on,
          onPressed: () => Modular.to.navigate('/relatorios/estoque'),
        ),
      ),
    );
  }
}
