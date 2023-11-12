import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final double productRating;
  final String totalSold;
  final int remainingStock;
  final String productSpecification;
  final String productDescription;

  const DetailProduct({super.key, 
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productRating,
    required this.totalSold,
    required this.remainingStock,
    required this.productSpecification,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${productPrice.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(productRating.toString(),
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      Text('Terjual $totalSold',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      Text('Stok $remainingStock',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Spesifikasi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productSpecification,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDescription,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
