import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imc/observables/future/future_controller.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final controller = FutureController();

  @override
  void initState() {
    controller.buscarNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (() {
          controller.buscarNome();
        })),
        body: Observer(
          builder: (_) {
            return FutureBuilder<String>(
                future: controller.nomeFuture,
                builder: ((context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return SizedBox.shrink();
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return Center(
                          child: Text(snapshot.data!),
                        );
                      }
                      return Center(
                        child: Text("Nome não encontrado"),
                      );
                  }
                }));
          },
        ));
  }
}
