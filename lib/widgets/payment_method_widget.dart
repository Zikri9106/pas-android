import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget {
  final Function(String) onPaymentMethodSelected;

  const PaymentMethodWidget({Key? key, required this.onPaymentMethodSelected})
      : super(key: key);

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 81, 80, 112),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPaymentMethodRadioButton('assets/images/bri_logo.png', 'BRI',),
            buildPaymentMethodRadioButton('assets/images/bni_logo.png', 'BNI'),
            buildPaymentMethodRadioButton('assets/images/visa_logo.png', 'Visa'),
            buildPaymentMethodRadioButton('assets/images/mandiri_logo.png', 'Mandiri'),
          ],
        ),
      ],
    );
  }

  Widget buildPaymentMethodRadioButton(String imagePath, String paymentMethodName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedPaymentMethod = paymentMethodName;
              widget.onPaymentMethodSelected(selectedPaymentMethod);
            });
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              color: selectedPaymentMethod == paymentMethodName
                  ? Color.fromARGB(255, 255, 142, 110)
                  : Colors.white,
            ),
            child: Image.asset(imagePath, width: 10, height: 10),
          ),
        ),
        SizedBox(height: 8),
        Text(
          paymentMethodName,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 81, 80, 112),
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
