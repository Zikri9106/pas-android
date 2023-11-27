import 'package:get/get.dart';
import 'package:pas_android/Controllers/controller_list_product.dart';
import 'package:pas_android/model/product_response_model.dart';

class ProductSearchController extends GetxController {
  final ControllerListProduct productListController = Get.find();
  final RxList<ProductResponseModel> searchResults = <ProductResponseModel>[].obs;

  @override
  void onInit() {
    searchResults.assignAll(productListController.productResponModelCtr);
    super.onInit();
  }

  void searchProducts(String query) {
    searchResults.clear();
    searchResults.addAll(
      productListController.productResponModelCtr.where(
        (product) => product.namaBarang.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }
}
