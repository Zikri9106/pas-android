import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Navigation.dart';

class PaymentCompleteDialog extends StatelessWidget {
  final String productName;
  final String totalAmount;
  final String paymentMethod;

  PaymentCompleteDialog({
    required this.productName,
    required this.totalAmount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Pembayaran Selesai',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 142, 110),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Terima kasih telah berbelanja!',
            style: TextStyle(
              color: Color.fromARGB(255, 81, 80, 112),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Text('Barang yang dibeli: \n$productName', style: TextStyle(color: Color.fromARGB(255, 81, 80, 112), fontSize: 11, fontWeight: FontWeight.bold)),
          Text('Total Harga: Rp. $totalAmount', style: TextStyle(color: Color.fromARGB(255, 81, 80, 112), fontSize: 11, fontWeight: FontWeight.bold)),
          Text('Metode Pembayaran: $paymentMethod', style: TextStyle(color: Color.fromARGB(255, 81, 80, 112), fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.to(() => Navigation(email: '', name: ''));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 255, 142, 110),
            ),
          ),
          child: Text(
            'OK',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
