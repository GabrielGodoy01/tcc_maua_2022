import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/estoque/infra/model/estoque_model.dart';
import 'package:tcc_maua_2022/app/modules/estoque/presentation/controllers/estoque_controller.dart';
import '../../../../../shared/domain/infra/tipo_campo_enum.dart';
import '../../../../../shared/widgets/fields/drop_down_field_custom_widget.dart';
import '../../../../../shared/widgets/fields/text_form_field_custom_widget.dart';
import '../../../../../shared/widgets/buttons/form_button_widget.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({Key? key}) : super(key: key);

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final controller = Modular.get<EstoqueController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showInitDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showInitDialog(context);
        },
        label: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36.0,
        ),
      ),
      body: SafeArea(
        child: Center(
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
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Cadastro de Estoque',
                            style: TextStyle(fontSize: 36),
                          ),
                          Text(
                            '* Campos obrigatórios',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        TextFormFieldCustomWidget(
                          size: 0,
                          titulo: 'Descrição *',
                          onChanged: controller.setDescricao,
                          isRequired: true,
                          value: controller.estoque.descricao,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Localização',
                          onChanged: controller.setLocalizacao,
                          value: controller.estoque.localizacao,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.numero,
                          titulo: 'Estoque Mínimo *',
                          onChanged: (value) {
                            var valor = int.parse(value);
                            controller.setEstoqueMinimo(valor);
                          },
                          isRequired: true,
                          value: controller.estoque.estoqueMinimo == 0
                              ? ''
                              : controller.estoque.estoqueMinimo.toString(),
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.numero,
                          titulo: 'Estoque Máximo *',
                          onChanged: (value) {
                            var valor = int.parse(value);
                            controller.setEstoqueMaximo(valor);
                          },
                          isRequired: true,
                          value: controller.estoque.estoqueMaximo == 0
                              ? ''
                              : controller.estoque.estoqueMaximo.toString(),
                        ),
                        TextFormFieldCustomWidget(
                          size: 2,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.numero,
                          titulo: 'Quantidade',
                          onChanged: (value) {
                            var valor = int.parse(value);
                            controller.setQuantidade(valor);
                          },
                          value: controller.estoque.quantidade == 0
                              ? ''
                              : controller.estoque.quantidade.toString(),
                        ),
                        TextFormFieldCustomWidget(
                          size: 2,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.valor,
                          titulo: 'Custo',
                          onChanged: (value) {
                            var valor = value
                                .replaceRange(0, 2, '')
                                .replaceAll(',', '.');
                            var valorDouble = double.parse(valor);
                            controller.setCusto(valorDouble);
                          },
                          value: controller.estoque.custo == 0
                              ? ''
                              : controller.estoque.custo.toString(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: FormButtonWidget(
                              icon: Icons.check,
                              titulo: 'Salvar',
                              onPressed: () {
                                setState(() {
                                  controller.salvarItem();
                                });
                              },
                            ),
                          ),
                          FormButtonWidget(
                            icon: Icons.replay_outlined,
                            titulo: 'Limpar',
                            onPressed: () {
                              setState(() {
                                controller.limparTexto();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void showInitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
              'Escolha se deseja alterar ou adicionar novo estoque:'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormButtonWidget(
                icon: Icons.add,
                titulo: 'Novo Estoque',
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              FormButtonWidget(
                icon: Icons.replay_outlined,
                titulo: 'Alterar Estoque',
                onPressed: () {
                  Modular.to.pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Escolha o estoque que deseja alterar:'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropDownFieldCustomWidget<EstoqueModel>(
                                onChanged: (value) {
                                  setState(() {
                                    controller.selectEstoque(value!);
                                  });
                                },
                                items: controller.listaItensEstoque
                                    .map((EstoqueModel value) {
                                  return DropdownMenuItem<EstoqueModel>(
                                    value: value,
                                    child: Text(value.descricao),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FormButtonWidget(
                                    backgroundColor: Colors.red,
                                    icon: Icons.close,
                                    titulo: 'Cancelar',
                                    onPressed: () {
                                      Modular.to.pop();
                                      setState(() {
                                        controller.estoque =
                                            EstoqueModel.newInstance();
                                      });
                                    },
                                  ),
                                  FormButtonWidget(
                                    icon: Icons.verified,
                                    titulo: 'Confirmar',
                                    onPressed: () {
                                      Modular.to.pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
