import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/list/observable_list_controller.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({Key? key}) : super(key: key);

  @override
  _ObservableListPageState createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final controller = ObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObservableList'),
      ),
      body: Column(
        children: [
          Expanded(child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: ((context, index) {
                  return CheckboxListTile(
                    value: false,
                    onChanged: (_) {},
                    title: Text("${controller.products[index].name}"),
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
