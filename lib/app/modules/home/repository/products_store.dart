import 'package:dentist/app/models/product.dart';
import 'package:dentist/app/utils/jsonRead.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'dart:convert' as convert;

part 'products_store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;

abstract class _ProductsStoreBase with Store {
  @observable
  ObservableList<Product>? products = ObservableList<Product>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadProducts({String? category}) async {


    try {
      isLoading = true;

      // Load the JSON file
      String jsonString =
              await rootBundle.loadString('assets/json/product_list.json');

      // Parse the JSON string
      List<dynamic> jsonList = convert.json.decode(jsonString);

      // Convert each JSON object into a Product and add it to the products list
      products?.clear();
      for (var item in jsonList) {

            Product product = Product.fromMap(item);
            if(category == null || product.categoria == category) {
              products?.add(product);
            }
          }
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  @computed
  bool get hasResults => !isLoading && products!.isNotEmpty;
}
