import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/controllers/product_search_controller.dart';
import 'package:pas_android/pages/detail_product.dart';
import 'package:pas_android/widgets/product_card.dart';

class SearchPage extends StatelessWidget {
  final ProductSearchController productSearchController =
      Get.put(ProductSearchController());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 10, right: 10, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 81, 80, 112),
                style: const TextStyle(color: Color.fromARGB(255, 81, 80, 112)),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromARGB(255, 255, 142, 110)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Cari...',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(125, 81, 80, 112)),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                onChanged: (query) {
                  productSearchController.searchProducts(query);
                },
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productSearchController.searchResults.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    final product =
                        productSearchController.searchResults[index];
                    return GestureDetector(
                      onTap: () async {
                        Get.to(DetailProduct(product));
                      },
                      child: ProductCard(
                        image: product.gambarBarang,
                        title: product.namaBarang,
                        price: product.hargaBarang,
                        rating: product.rating,
                        totalBuy: product.jumlahTerjual,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
