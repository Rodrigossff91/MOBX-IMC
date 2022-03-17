import 'package:mobx/mobx.dart';

part 'future_controller.g.dart';

class FutureController = _FutureControllerBase with _$FutureController;

abstract class _FutureControllerBase with Store {
  @observable
  //var nomeFuture = Future.value('').asObservable();
  var nomeFuture = ObservableFuture.value('');

  Future<void> buscarNome() async {
    final buscarNomeFuture =
        Future.delayed(Duration(seconds: 2), () => "Rodrigo Ferreira");
    nomeFuture = buscarNomeFuture.asObservable();
    nomeFuture = ObservableFuture(buscarNomeFuture);
  }
}
