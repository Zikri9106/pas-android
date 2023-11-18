import 'package:get/get.dart';
import 'package:pas_android/model/product_response_model.dart';

class CartController extends GetxController {
  final _products = <ProductResponseModel, int>{}.obs;

  Map<ProductResponseModel, int> get products => _products;

  void addProduct(ProductResponseModel product) {
    if (_products.containsKey(product)) {
      _products[product] = _products[product]! + 1;
    } else {
      _products[product] = 1;
    }
  }
}
