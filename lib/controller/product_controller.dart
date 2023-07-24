import 'dart:developer';

import 'package:get/get.dart';
import 'package:reubro_task/Model/product_model.dart';

import '../service/product_service.dart';

class ProductController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    getproducts();
  }


  RxList product =<ProductModel> [].obs;

  void getproducts()async{
    final response = await ProductService().getProduct();
    if(response != null){
      product.value = response.tagList;
    }else{
      log('nulll');
    }
  }


}