import 'package:flutter/material.dart';
import 'package:pas_android/model/product_response_model.dart';

class ProductCarouselCard extends StatelessWidget {
  final ProductResponseModel product;

  const ProductCarouselCard({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        MediaQuery.of(context).size.width - 20;
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
              width: cardWidth,
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
                  const SizedBox(height: 4),
                  Text(
                    'Rp${product.hargaBarang}',
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 255, 142, 110),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Icon Bintang, Rating, Icon Cart, dan Jumlah Terjual
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      Text(' ${product.rating}'),
                      const SizedBox(width: 8.0),
                      const Icon(Icons.shopping_cart,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      Text(' ${product.jumlahTerjual} Terjual'),
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
