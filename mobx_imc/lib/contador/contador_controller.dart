import 'package:mobx/mobx.dart';

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

class FullName {
  String first;
  String last;
  FullName({
    required this.first,
    required this.last,
  });

  FullName copyWith({
    String? first,
    String? last,
  }) {
    return FullName(
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FullName && other.first == first && other.last == last;
  }

  @override
  int get hashCode => first.hashCode ^ last.hashCode;
}
