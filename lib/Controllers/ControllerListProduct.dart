// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:pas_android/model/ProductResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ControllerListProduct extends GetxController {
    RxInt index = 0.obs;
  RxList<ProductResponseModel> productResponModelCtr =
      <ProductResponseModel>[].obs;
  SharedPreferences? prefs;
  RxBool isLoading = true.obs;

  // RxString sessionUsername = "".obs;
  // void loadSession() async{
  //   prefs = await SharedPreferences.getInstance();
  //   sessionUsername.value = prefs!.getString("username") ?? "no data";
  //   print("get username "+ sessionUsername.value.toString());
  // }

  @override
  void onInit(){
    super.onInit();
    // loadSession();
    loadData();
  }

  void loadData() async {
    try{
      final response = await http.get(Uri.parse(
          "https://778d-103-28-113-244.ngrok-free.app/api/product"));

      if (response.statusCode == 200) {
        // mengisi data productResponModelCtr dengan hasil json dari model
        productResponModelCtr.value = productResponseModelFromJson(response.body);
      } else {
        print("status code : " + response.statusCode.toString());
      }

      isLoading.value = false;

    }catch(e){
      print("error : "+e.toString());
    }
  }
}