import 'dart:math';

import 'package:mobx/mobx.dart';

part 'imc_controller.g.dart';

class ImcController = _ImcControllerBase with _$ImcController;

abstract class _ImcControllerBase with Store {
  @observable
  double imc = 0.0;

  @observable
  String? error;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> calcularImc(
      {required double peso, required double altura}) async {
    try {
      imc = 0.0;
      error = null;
      await Future.delayed(Duration(seconds: 1));

      imc = 50;

      await Future.delayed(Duration(seconds: 1));

      imc = peso / pow(altura, 2);

      if (imc > 30) {
        throw Exception();
      }
    } catch (e) {
      error = 'Error ao calcular o IMC';
    }
  }
}
