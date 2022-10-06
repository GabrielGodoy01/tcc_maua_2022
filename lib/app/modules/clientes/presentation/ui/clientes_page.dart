import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_maua_2022/app/modules/clientes/infra/model/clientes_model.dart';
import 'package:tcc_maua_2022/app/modules/clientes/presentation/controllers/clientes_controller.dart';
import 'package:tcc_maua_2022/app/shared/domain/infra/tipo_campo_enum.dart';
import '../../../../shared/widgets/fields/drop_down_field_custom_widget.dart';
import '../../../../shared/widgets/fields/text_form_field_custom_widget.dart';
import '../../../../shared/widgets/buttons/form_button_widget.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final controller = Modular.get<ClientesController>();

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
            height: MediaQuery.of(context).size.height * 0.8,
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
                            'Cadastro de Clientes',
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
                      runSpacing: 12,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        TextFormFieldCustomWidget(
                          size: 0,
                          titulo: 'Nome *',
                          onChanged: controller.setNome,
                          isRequired: true,
                          value: controller.cliente.nome,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Razão Social',
                          onChanged: controller.setRazaoSocial,
                          value: controller.cliente.razaoSocial,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'CNPJ/CPF *',
                          onChanged: controller.setCpf,
                          value: controller.cliente.cpf,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 0,
                          titulo: 'E-mail *',
                          onChanged: controller.setEmail,
                          value: controller.cliente.email,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Telefone 1 *',
                          onChanged: controller.setTelefone1,
                          value: controller.cliente.telefones[0],
                          tipoCampoTextoEnum: TipoCampoTextoEnum.telefone,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Telefone 2 *',
                          onChanged: controller.setTelefone2,
                          value: controller.cliente.telefones[1],
                          tipoCampoTextoEnum: TipoCampoTextoEnum.telefone,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Telefone 3 *',
                          onChanged: controller.setTelefone3,
                          value: controller.cliente.telefones[2],
                          tipoCampoTextoEnum: TipoCampoTextoEnum.telefone,
                        ),
                        TextFormFieldCustomWidget(
                          size: 0,
                          titulo: 'Nome Contato *',
                          onChanged: controller.setNomeContato,
                          value: controller.cliente.nomeContato,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'RG Contato *',
                          onChanged: controller.setRgContato,
                          value: controller.cliente.rgContato,
                          isRequired: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 32,
                      runSpacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'CEP *',
                          onChanged: controller.setCep,
                          value: controller.cliente.enderecoModel.cep,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.cep,
                          isRequired: true,
                        ),
                        FormButtonWidget(
                          icon: Icons.replay_outlined,
                          titulo: 'Consultar CEP',
                          onPressed: () async {
                            await controller.procuraCep(
                                controller.enderecoCliente.cep.toString());
                            setState(() {});
                          },
                        ),
                        Observer(builder: (_) {
                          return Text(
                            controller.cepError,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                        TextFormFieldCustomWidget(
                          size: 0,
                          isEnabled: false,
                          titulo: 'Endereço *',
                          value: controller.cliente.enderecoModel.endereco,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 2,
                          titulo: 'Número *',
                          value: controller.cliente.enderecoModel.numero,
                          isRequired: true,
                          tipoCampoTextoEnum: TipoCampoTextoEnum.numero,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Bairro *',
                          isEnabled: false,
                          value: controller.cliente.enderecoModel.bairro,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 1,
                          titulo: 'Cidade *',
                          isEnabled: false,
                          value: controller.cliente.enderecoModel.cidade,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 2,
                          titulo: 'Estado *',
                          isEnabled: false,
                          value: controller.cliente.enderecoModel.estado,
                          isRequired: true,
                        ),
                        TextFormFieldCustomWidget(
                          size: 0,
                          titulo: 'Complemento',
                          onChanged: controller.setComplemento,
                          value: controller.cliente.enderecoModel.complemento,
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
                                  controller.salvarCliente();
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
              'Escolha se deseja alterar ou adicionar novo cliente:'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormButtonWidget(
                icon: Icons.add,
                titulo: 'Novo Cliente',
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              FormButtonWidget(
                icon: Icons.replay_outlined,
                titulo: 'Alterar Cliente',
                onPressed: () {
                  Modular.to.pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Escolha o cliente que deseja alterar:'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropDownFieldCustomWidget<ClientesModel>(
                                onChanged: (value) {
                                  setState(() {
                                    controller.cliente = value!;
                                  });
                                },
                                items: controller.listaClientes
                                    .map((ClientesModel value) {
                                  return DropdownMenuItem<ClientesModel>(
                                    value: value,
                                    child: Text(value.nome),
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
                                        controller.cliente =
                                            ClientesModel.newInstance();
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 8,
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
