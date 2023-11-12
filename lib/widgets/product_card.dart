import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final double rating;
  final String totalBuy;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.totalBuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        MediaQuery.of(context).size.width - 20; // Lebar layar dikurangi margin

    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        surfaceTintColor: Colors.white,
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: cardWidth * 0.25,
                height: cardWidth * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 81, 80, 112),
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp$price',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 142, 110),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color.fromARGB(255, 255, 142, 110)),
                        Text(
                          ' $rating',
                          style: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16.0),
                        const Icon(Icons.shopping_cart,
                            color: Color.fromARGB(255, 255, 142, 110)),
                        Text(
                          ' $totalBuy Terjual',
                          style: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
