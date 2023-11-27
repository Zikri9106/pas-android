// cart_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Controllers/cart_controller.dart';
import 'package:pas_android/model/product_response_model.dart';
import 'package:pas_android/pages/checkout_page.dart';
import 'package:pas_android/widgets/cart_item_card.dart';
import 'package:pas_android/widgets/checkout_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find<CartController>();
  Map<ProductResponseModel, bool> checkedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        titleSpacing: 20,
        title: const Text(
          'Keranjangmu',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 142, 110),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (cartController.products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/empty.png', height: 80),
                        const SizedBox(height: 15),
                        const Text(
                          'Belum ada barang yang tersedia di Keranjang',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 81, 80, 112)),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: cartController.products.length,
                  itemBuilder: (context, index) {
                    var productEntry =
                        cartController.products.entries.elementAt(index);
                    ProductResponseModel product = productEntry.key;
                    int quantity = productEntry.value.quantity;

                    bool isChecked = checkedItems.containsKey(product) &&
                        checkedItems[product] == true;

                    return Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        children: [
                          Expanded(
                            child: Checkbox(
                              activeColor: Color.fromARGB(255, 255, 142, 110),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  checkedItems[product] = value ?? false;
                                  cartController.products[product]!.isChecked =
                                      value ?? false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: CartItemCard(
                              product: product,
                              quantity: quantity,
                              onDelete: () {
                                cartController.removeFromCart(product);
                                Get.snackbar(
                                  'Produk Dihapus',
                                  'Kamu telah menghapus ${product.namaBarang} dari keranjang.',
                                  duration: const Duration(seconds: 2),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
            CheckoutAppBar(
              onCheckoutPressed: () {
                List<ProductResponseModel> checkedProducts = checkedItems
                    .entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();
                Get.to(() => CheckoutPage(
                      checkedProducts: checkedProducts,
                      checkedItems: checkedItems,
                    ));
              },
              cartController: cartController,
            ),
        ],
      ),
    );
  }
}
