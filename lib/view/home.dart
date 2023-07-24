import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:reubro_task/constants/appcontants.dart';
import 'package:reubro_task/controller/product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'MWS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: productController.product.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: 
                 Column(
                  children: [
                    Container(
                      height: Appcontants.height(context) * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                productController. product[index]. imageLink),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      productController.product[index].name,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Appcontants.h10,
                    Text(
                      productController.product[index].brand.name,
                      style: const TextStyle(color: Colors.grey, fontSize: 19),
                    ),
                    Appcontants.h10,
                    Text(
                      '₹ ${productController.product[index].price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    RatingBarIndicator(
                      rating:
                          productController.product[index].rating?.toDouble() ??
                              5.0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                    Appcontants.h10,
                    Text(
                      productController.product[index].description,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
            
            ),
          );
        },
      ), ),
      drawer: const Drawer(),
    );
  }
}
