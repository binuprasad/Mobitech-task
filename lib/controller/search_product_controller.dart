import 'package:get/get.dart';
import 'package:reubro_task/Model/product_model.dart';
import 'package:reubro_task/controller/product_controller.dart';

class SearchProductController extends GetxController {
  final homecontroller = Get.put(ProductController());
  List<ProductModel> foundtufs = [];
  @override
  void onInit() {
    foundtufs = homecontroller.product;
    super.onInit();
  }

  void runFilter(String enteredKeyword) {
    List<ProductModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = homecontroller.product;
    } else {
      results = homecontroller.product
          .where((element) => element.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    foundtufs = results;
    update();
  }
}