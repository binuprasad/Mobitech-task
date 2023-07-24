import 'dart:developer';

import 'package:get/get.dart';
import 'package:reubro_task/Model/product_model.dart';

import '../service/product_service.dart';

class ProductController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    getproducts();
    ProductService().getProduct();
  }


  RxList  <ProductModel> product = <ProductModel>[].obs;

  void getproducts()async{
    final response = await ProductService().getProduct();
    // log(response!.description.toString());
    if(response != null){
      log('entered');
      product.value = response ;
    }else{
      log('nulll');
    }
  }


}