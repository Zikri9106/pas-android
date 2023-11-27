import 'package:get/get.dart';
import 'package:pas_android/model/product_response_model.dart';

class CartController extends GetxController {
  RxMap<ProductResponseModel, CartItemData> products =
      <ProductResponseModel, CartItemData>{}.obs;

  void addToCart(ProductResponseModel product) {
    if (products.containsKey(product)) {
      products[product]!.quantity += 1;
    } else {
      products[product] = CartItemData(quantity: 1, isChecked: false);
    }
  }

  void removeFromCart(ProductResponseModel product) {
    if (products.containsKey(product)) {
      products.remove(product);
    }
  }

  int get totalItems => products.length;

  int get totalAmount {
    int total = 0;

    products.forEach((product, cartItemData) {
      if (cartItemData.isChecked) {
        String hargaBarangWithoutDots = product.hargaBarang.replaceAll('.', '');
        hargaBarangWithoutDots = hargaBarangWithoutDots.replaceAll('Rp.', '');
        int parsedHargaBarang = int.tryParse(hargaBarangWithoutDots) ?? 0;

        total += (parsedHargaBarang * cartItemData.quantity);
      }
    });

    return total;
  }
}

class CartItemData {
  int quantity;
  bool isChecked;

  CartItemData({required this.quantity, required this.isChecked});
}
