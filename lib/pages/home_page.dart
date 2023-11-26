// File: home_page.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:pas-android/controllers/controller_detail_product.dart';
import 'package:pas-android/controllers/controller_list_product.dart';
import 'package:pas-android/widgets/product_card.dart';
import 'package:pas-android/widgets/product_carousel_card.dart';
import 'account/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = Get.put(ControllerListProduct());
  final detailController = Get.put(ControllerDetailProduct());
  int currentCarouselPage = 0;
  int selectedIndex = 0;
  List<Widget> pages = [
    Container(child: const Center(child: Text("Next Page"),),),
    Container(child: const Center(child: Text("Next Pageeee"),),),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),
      body: Obx(() => productController.isLoading.value
          ? const CircularProgressIndicator()
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Hello, User \nXiaomi",
                            style: TextStyle(
                              fontSize: 20,
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
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Barang Terpopuler",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 81, 80, 112),
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
                                    await detailController
                                        .loadProductsFromDatabase();
                                    detailController.selectedDetail(index);
                                  },
                                  child: ProductCarouselCard(product: product),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
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
                      const Text(
                        "Barang Terbaru",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 81, 80, 112),
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
                          return ProductCard(
                            image: product.gambarBarang,
                            title: product.namaBarang,
                            price: product.hargaBarang,
                            rating: product.rating,
                            totalBuy: product.jumlahTerjual,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home"
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
