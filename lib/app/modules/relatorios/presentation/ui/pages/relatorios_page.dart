import 'package:flutter/material.dart';
import 'package:tcc_maua_2022/app/modules/relatorios/presentation/ui/pages/relatorio_estoque_page.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.7,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.grid_on),
                        text: 'Relatório de Estoque',
                      ),
                      Tab(icon: Icon(Icons.change_circle)),
                      Tab(icon: Icon(Icons.change_circle)),
                    ],
                  ),
                ),
                const Flexible(
                  child: TabBarView(
                    children: [
                      RelatorioEstoquePage(),
                      Center(child: CircularProgressIndicator()),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
