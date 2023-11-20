import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Controllers/cart_controller.dart';
import 'package:pas_android/model/product_response_model.dart';
import 'package:pas_android/widgets/cart_item_card.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({super.key});

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
      body: Obx(
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
                        fontSize: 14, color: Color.fromARGB(255, 81, 80, 112)),
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
              int quantity = productEntry.value;

              return CartItemCard(
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
              );
            },
          );
        },
      ),
    );
  }
}
