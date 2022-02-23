import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatefulWidget {
  ContadorCodegenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  @override
  void initState() {
    super.initState();

    // autorun fica escutando as variaveis que estão sendo usada dentro dele
    // e também roda logo quando criado !!!
    final autorunDisposer = autorun(
      (p0) {
        print("--------------------  auto run --------------------");
        print(controller.fullName.first);
        // print(controller.fullName.last);
      },
    );

    // reaction nós falamos para o mobx qual atributo obsrvavel que queremos abservar
    final reactionDisposeer = reaction((_) => controller.counter, (counter) {
      print("--------------------  reaction --------------------");
      print("Add mais ${controller.counter}");
    });

    // when so será rodado uma unica vez
    final whenDisposer =
        when((p0) => controller.fullName.first == "Rodrigo", () {
      print("--------------------  when --------------------");
      print(controller.fullName.first);
    });

    reactionDisposer.add(autorunDisposer);
    reactionDisposer.add(whenDisposer);
    reactionDisposer.add(reactionDisposeer);
  }

  @override
  void dispose() {
    reactionDisposer.forEach((element) {
      element.reaction.dispose();
    });
    super.dispose();
  }

  final controller = ContadorCodegenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador mobx codegen"),
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
            }),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.changeName();
                },
                child: Text("Mudar nome")),
            ElevatedButton(
                onPressed: () {
                  controller.rollbackName();
                },
                child: Text("Voltar nome"))
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
