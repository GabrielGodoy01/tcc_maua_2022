import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'appbar_button_widget.dart';
import 'controller/appbar_controller.dart';

class VerticalAppbarWidget extends StatelessWidget {
  const VerticalAppbarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<AppbarController>();
    return Observer(builder: (context) {
      return Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(children: [
            VerticalNavbarButtonWidget(
              buttonText: 'INÍCIO',
              indexToShow: controller.indexToShow,
              icon: Icons.home,
              myIndex: 0,
              onPressed: () {
                controller.toggleIndex(0);
                Modular.to.navigate('/home/');
              },
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavbarButtonWidget(
              buttonText: 'CLIENTES',
              indexToShow: controller.indexToShow,
              myIndex: 1,
              onPressed: () async {
                await controller.toggleIndex(1);
                Modular.to.navigate('/clientes/');
              },
              icon: Icons.person,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavbarButtonWidget(
              buttonText: 'ESTOQUE',
              indexToShow: controller.indexToShow,
              myIndex: 2,
              onPressed: () async {
                await controller.toggleIndex(2);
                Modular.to.navigate('/estoque/');
              },
              icon: Icons.grid_on,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavbarButtonWidget(
              buttonText: 'VENDAS',
              indexToShow: controller.indexToShow,
              myIndex: 3,
              onPressed: () async {
                await controller.toggleIndex(3);
                Modular.to.navigate('/vendas/');
              },
              icon: Icons.attach_money,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavbarButtonWidget(
              buttonText: 'RELATÓRIOS',
              indexToShow: controller.indexToShow,
              myIndex: 4,
              onPressed: () async {
                await controller.toggleIndex(4);
                Modular.to.navigate('/relatorios/');
              },
              icon: Icons.show_chart,
            ),
          ]),
        ),
      );
    });
  }
}
