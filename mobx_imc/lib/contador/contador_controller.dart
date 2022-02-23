import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/full_name.dart';

class ContadorController {
  var _counter = Observable(0);
  int get counter => _counter.value;
  var _fullName = Observable<FullName>(FullName(first: "first", last: "last"));

  FullName get fullName => _fullName.value;

  late Action increment;
  late Computed _saudacaoComputed;

  ContadorController() {
    _saudacaoComputed =
        Computed(() => "Olá ${_fullName.value.first}, ${_counter.value}");
    increment = Action(_incrementCounter);
  }

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    // ! Não pode fazer isso aqui
    // _fullName.value.first = "Rodrigo";
    // _fullName.value.last = "Ferreira";

    // ! Opção 1 alterar por meio de prototype (copyWith)
    // ! Trocar isso
    // _fullName.value = FullName(first: "Rodrigo", last: "Ferreira");

    // ! Por:
    _fullName.value =
        _fullName.value.copyWith(first: "Rodrigo", last: "Ferreira");
  }
}
