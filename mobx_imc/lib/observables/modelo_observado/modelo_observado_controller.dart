import 'package:mobx/mobx.dart';
import 'package:mobx_imc/observables/modelo_observado/model/product_store.dart';

import '../../model/product_model.dart';

part 'modelo_observado_controller.g.dart';

class ModeloObservadoController = _ModeloObservadoControllerBase
    with _$ModeloObservadoController;

abstract class _ModeloObservadoControllerBase with Store {
  @observable
  //  var products = <ProductModel>[];
  // ObservableList products = ObservableList();

  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductStore(
          product: ProductModel(
            name: "Computador",
          ),
          selected: false),
      ProductStore(
          product: ProductModel(
            name: "Carro",
          ),
          selected: false),
      ProductStore(
          product: ProductModel(
            name: "Boné",
          ),
          selected: false),
      ProductStore(
          product: ProductModel(
            name: "Camiseta",
          ),
          selected: false)
    ];

    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(
      ProductStore(
          product: ProductModel(
            name: "Computador",
          ),
          selected: false),
    );
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }
}
