import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_response_model.dart';

class DetailProduct extends StatelessWidget {
  final ProductResponseModel product;

  const DetailProduct(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 81, 80, 112)),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-mishop.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'MiShop',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 142, 110),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 81, 80, 112)),
            onPressed: () {
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.gambarBarang,
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 18.0, left: 18.0, bottom: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.namaBarang,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 81, 80, 112),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${product.hargaBarang.toString()}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 142, 110),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Color.fromARGB(255, 255, 142, 110), size: 16),
                      const SizedBox(width: 4),
                      Text(product.rating.toString(),
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 50),
                      const Icon(Icons.sell,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      const SizedBox(width: 4),
                      Text('${product.jumlahTerjual} terjual',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 50),
                      const Icon(Icons.shopping_cart,
                          color: Color.fromARGB(255, 255, 142, 110), size: 15),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('${product.sisaBarang} Stok',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Spesifikasi',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 142, 110),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.spesifikasiBarang,
                    style: const TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 81, 80, 112)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 142, 110),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.deskripsiBarang,
                    style: const TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 81, 80, 112)),
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
