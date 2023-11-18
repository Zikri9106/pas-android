import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Controllers/cart_controller.dart';
import 'package:pas_android/model/product_response_model.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cartController.products.length,
          itemBuilder: (context, index) {
            var productEntry = cartController.products.entries.elementAt(index);
            ProductResponseModel product = productEntry.key;
            int quantity = productEntry.value;

            return ListTile(
              title: Text(product.namaBarang),
              subtitle: Text('Quantity: $quantity'),
            );
          },
        ),
      ),
    );
  }
}
