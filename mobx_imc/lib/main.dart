import 'package:flutter/material.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_observado_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ModeloObservadoPage(),
    );
  }
}
