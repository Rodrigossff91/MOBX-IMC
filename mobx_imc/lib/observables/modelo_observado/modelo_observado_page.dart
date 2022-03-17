import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_observado_controller.dart';

class ModeloObservadoPage extends StatefulWidget {
  const ModeloObservadoPage({Key? key}) : super(key: key);

  @override
  _ModeloObservadoPageState createState() => _ModeloObservadoPageState();
}

class _ModeloObservadoPageState extends State<ModeloObservadoPage> {
  final controller = ModeloObservadoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelo Observable'),
      ),
      body: Column(
        children: [
          Expanded(child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: ((context, index) {
                  final productStore = controller.products[index];
                  return Observer(
                    builder: (_) {
                      return CheckboxListTile(
                          value: productStore.selected,
                          onChanged: (_) {
                            controller.selectedroduct(index);
                          },
                          title: Text("${productStore.product.name}"));
                      ;
                    },
                  );
                }),
              );
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.addProduct();
                },
                child: Text("Adicionar"),
              ),
              TextButton(
                onPressed: () {
                  controller.removeProduct();
                },
                child: Text("Remover"),
              ),
              TextButton(
                onPressed: () {
                  controller.loadProducts();
                },
                child: Text("Carregar"),
              )
            ],
          )
        ],
      ),
    );
  }
}
