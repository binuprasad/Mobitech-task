import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reubro_task/Model/product_model.dart';

class ProductService{
  Future<List< ProductModel>?>getProduct()async{
    Dio dio = Dio();
    try {
      Response response =await dio.get('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
      // log("${response.data} ------before");
      if(response.statusCode == 200){
        log("${response.data} ----- status 2000");
        final List<ProductModel> list = (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
        return list;
      }
      
    } catch (e) {
      log(e.toString());
      
    }
    return null;
  }
}