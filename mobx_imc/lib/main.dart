import 'package:flutter/material.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_page.dart';

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
      home: ContadorCodegenPage(),
    );
  }
}
