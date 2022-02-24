import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';

part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase
    with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  @observable
  //  var products = <ProductModel>[];
  // ObservableList products = ObservableList();

  var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductModel(name: "Computador"),
      ProductModel(name: "Monitor"),
      ProductModel(name: "Teclado"),
      ProductModel(name: "Vanessa")
    ];

    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: "aaaa"));
  }

  @action
  void removeProduct() {
    products.removeWhere((element) => element.name == "aaaa");
  }
}
