import 'package:get/get.dart';
import 'package:pas_android/model/product_response_model.dart';

class CartController extends GetxController {
  RxMap products = {}.obs;

  void addToCart(ProductResponseModel product) {
    if (products.containsKey(product)) {
      products[product] = products[product]! + 1;
    } else {
      products[product] = 1;
    }
  }

  void removeFromCart(ProductResponseModel product) {
    if (products.containsKey(product)) {
      products.remove(product);
    }
  }

  // Metode untuk mendapatkan total item di keranjang
  int get totalItems => products.length;

  // Metode untuk mendapatkan total harga di keranjang
  int get totalAmount {
    int total = 0;
    products.forEach((product, quantity) {
      total += (product.hargaBarang * quantity) as int;
    });
    return total;
  }
}
