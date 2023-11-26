// checkout_appbar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/cart_controller.dart';

class CheckoutAppBar extends StatelessWidget {
  final CartController cartController;
  final VoidCallback onCheckoutPressed;

  const CheckoutAppBar({
    Key? key,
    required this.cartController,
    required this.onCheckoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                print(
                    'Rebuild widget with Total Harga: ${cartController.totalAmount.toStringAsFixed(0)}');
                return Text(
                  'Total Harga: Rp. ${cartController.totalAmount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 81, 80, 112),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.45, 50)),
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 142, 110)),
              ),
                onPressed:
                    cartController.totalAmount > 0 ? onCheckoutPressed : null,
                child: const Text('Checkout', style: TextStyle(fontSize: 15, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
