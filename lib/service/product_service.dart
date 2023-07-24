import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reubro_task/Model/product_model.dart';

class ProductService{
  Future<ProductModel?>getProduct()async{
    Dio dio = Dio();
    try {
      Response response =await dio.get('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
      if(response.statusCode == 200){
        log(response.data);
        return ProductModel.fromJson(response.data);
      }
      
    } catch (e) {
      log(e.toString());
      
    }
    return null;
  }
}