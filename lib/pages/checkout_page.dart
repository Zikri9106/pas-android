import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Navigation.dart';

import '../Controllers/cart_controller.dart';
import '../model/product_response_model.dart';

class CheckoutPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final Map<ProductResponseModel, bool> checkedItems;
  final List<ProductResponseModel> checkedProducts;

  CheckoutPage(
      {Key? key, required this.checkedProducts, required this.checkedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 81, 80, 112)),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 142, 110),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produk Dipilih',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 81, 80, 112),
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: checkedProducts.length,
              itemBuilder: (context, index) {
                var product = checkedProducts[index];
                return ListTile(
                  title: Text(product.namaBarang),
                  subtitle: Text(
                      'Jumlah: ${cartController.products[product]!.quantity}'),
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              'Total Harga:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 81, 80, 112),
              ),
            ),
            SizedBox(height: 8),
            Obx(() {
              return Text(
                'Rp. ${cartController.totalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 81, 80, 112),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        height: 75,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    'Pembayaran Selesai',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 142, 110)),
                  ),
                  content: Text('Terima kasih telah berbelanja!',style: TextStyle(color: Color.fromARGB(255, 81, 80, 112), fontSize: 12),),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => Navigation());
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 142, 110),
                        ),
                      ),
                      child: Text('OK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ],
                );
              },
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 255, 142, 110),
            ),
          ),
          child: const Text(
            'Checkout Sekarang',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
