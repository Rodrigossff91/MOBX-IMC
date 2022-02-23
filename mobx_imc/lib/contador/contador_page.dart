import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/contador/contador_controller.dart';

class ContadorPage extends StatelessWidget {
  final controller = ContadorController();
  ContadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador mobx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (context) {
              return Text(
                "${controller.counter}",
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(builder: (context) {
              return Column(
                children: [
                  Text(controller.fullName.first),
                  Text(controller.fullName.last)
                ],
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (context) {
              return Text(controller.saudacao);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
