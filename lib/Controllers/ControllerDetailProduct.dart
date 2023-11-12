import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_android/model/ProductResponseModel.dart';
import 'package:pas_android/pages/detail_product.dart';

class ControllerDetailProduct extends GetxController {
  RxList<ProductResponseModel> products = <ProductResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProductsFromDatabase();
  }

  Future<void> loadProductsFromDatabase() async {
    try {
      final response = await http.get(
        Uri.parse("https://edf5-2404-c0-7050-00-8ba1-c62e.ngrok-free.app/api/product"),
      );

      if (response.statusCode == 200) {
        List<ProductResponseModel> productList =
            productResponseModelFromJson(response.body);
        products.assignAll(productList);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  ProductResponseModel getProductAtIndex(int index) {
    return products[index];
  }

  void selectedDetail(int index) {
    Get.to(DetailProduct(
      productName: getProductAtIndex(index).namaBarang,
      productImage: getProductAtIndex(index).gambarBarang,
      productPrice: getProductAtIndex(index).hargaBarang,
      productRating: getProductAtIndex(index).rating,
      totalSold: getProductAtIndex(index).jumlahTerjual,
      remainingStock: getProductAtIndex(index).sisaBarang,
      productSpecification: getProductAtIndex(index).spesifikasiBarang,
      productDescription: getProductAtIndex(index).deskripsiBarang,
    ));
  }

  int getProductsCount() {
    return products.length;
  }
}
