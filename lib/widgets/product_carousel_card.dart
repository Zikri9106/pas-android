import 'package:flutter/material.dart';
import 'package:pas_android/model/product_response_model.dart';

class ProductCarouselCard extends StatelessWidget {
  final ProductResponseModel product;

  const ProductCarouselCard({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            product.gambarBarang,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.namaBarang,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Rp${product.hargaBarang}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 255, 142, 110),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      Text(' ${product.rating}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
                      const SizedBox(width: 8.0),
                      const Icon(Icons.shopping_cart,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      Text(' ${product.jumlahTerjual} Terjual', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
