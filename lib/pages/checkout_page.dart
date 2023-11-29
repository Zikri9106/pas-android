import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/cart_controller.dart';
import '../model/product_response_model.dart';
import '../widgets/payment_complete_dialog.dart';
import '../widgets/payment_method_widget.dart';

class CheckoutPage extends StatefulWidget {
  final CartController cartController = Get.find<CartController>();
  final Map<ProductResponseModel, bool> checkedItems;
  final List<ProductResponseModel> checkedProducts;

  CheckoutPage(
      {Key? key, required this.checkedProducts, required this.checkedItems})
      : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPaymentMethod = '';

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
            SizedBox(height: 10),
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
              itemCount: widget.checkedProducts.length,
              itemBuilder: (context, index) {
                var product = widget.checkedProducts[index];
                return ListTile(
                  title: Text(product.namaBarang),
                  subtitle: Text(
                      'Jumlah: ${widget.cartController.products[product]!.quantity}'),
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
                'Rp. ${widget.cartController.totalAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 81, 80, 112),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            PaymentMethodWidget(
              onPaymentMethodSelected: (paymentMethod) {
                setState(() {
                  selectedPaymentMethod = paymentMethod;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        height: 75,
        child: ElevatedButton(
          onPressed: selectedPaymentMethod.isEmpty
              ? null
              : () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      var selectedProduct = widget.checkedProducts.firstWhere(
                        (product) => widget.checkedItems[product] == true,
                      );
                      return PaymentCompleteDialog(
                        productName: selectedProduct.namaBarang,
                        totalAmount: widget.cartController.totalAmount
                            .toStringAsFixed(0),
                        paymentMethod: selectedPaymentMethod,
                      );
                    },
                  );
                },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
            backgroundColor: selectedPaymentMethod.isEmpty
                ? MaterialStateProperty.all(Colors.grey)
                : const MaterialStatePropertyAll(
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
