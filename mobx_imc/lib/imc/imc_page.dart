import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/imc/imc_controller.dart';

import '../widgets/imc_gaude.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    var reactionErrorDisposer =
        reaction<bool>((_) => controller.hasError, (hasError) {
      if (hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(controller.error ?? "ERRO!!!!")));
      }
    });

    reactionDisposer.add(reactionErrorDisposer);
  }

  var imc = 0.0;
  @override
  void dispose() {
    reactionDisposer.forEach((element) => element());
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc MobX'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Observer(builder: (context) {
                  return ImcGaude(imc: controller.imc);
                }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Peso"),
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true)
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Peso obrigatório";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: alturaEC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Altura"),
                    ),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true)
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return " Altura obrigatória";
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_Br',
                          decimalDigits: 2,
                        );
                        double peso = formatter.parse(pesoEC.text) as double;
                        double altura =
                            formatter.parse(alturaEC.text) as double;
                        controller.calcularImc(peso: peso, altura: altura);
                      }
                    },
                    child: Text('Calcular IMC'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
