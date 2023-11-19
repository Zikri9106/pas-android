// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_android/Controllers/controller_list_product.dart';
import 'package:pas_android/pages/detail_product.dart';
import 'package:pas_android/pages/search_page.dart';
import 'package:pas_android/widgets/product_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pas_android/widgets/product_carousel_card.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = Get.put(ControllerListProduct());
  int currentCarouselPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Obx(() => productController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 142, 110),
            ))
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              "Hello, User \nXiaomi",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 142, 110),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 142, 110),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.search),
                                color: Colors.white,
                                onPressed: () {
                                  Get.to(SearchPage());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Barang Terpopuler",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 81, 80, 112),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              itemCount: min(
                                  10,
                                  productController
                                      .productResponModelCtr.length),
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                final sortedProducts = productController
                                    .productResponModelCtr
                                    .toList()
                                  ..sort(
                                      (a, b) => b.rating.compareTo(a.rating));
                                final product = sortedProducts[index];
                                return GestureDetector(
                                  onTap: () async {
                                    Get.to(DetailProduct(product));
                                  },
                                  child: ProductCarouselCard(product: product),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.75,
                                enableInfiniteScroll: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentCarouselPage = index;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            DotsIndicator(
                              dotsCount: min(
                                  10,
                                  productController
                                      .productResponModelCtr.length),
                              position: currentCarouselPage.toInt(),
                              decorator: const DotsDecorator(
                                color: Colors.grey,
                                activeColor: Color.fromARGB(255, 255, 142, 110),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Barang Terbaru",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 81, 80, 112),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: min(
                            20, productController.productResponModelCtr.length),
                        itemBuilder: (BuildContext ctx, int index) {
                          final product =
                              productController.productResponModelCtr[index];
                          return GestureDetector(
                            onTap: () async {
                              Get.to(DetailProduct(product));
                              // productController.index = index.obs;
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
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
