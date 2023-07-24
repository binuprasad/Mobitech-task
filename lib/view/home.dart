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
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    height: Appcontants.height(context) * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.wordstream.com/wp-content/uploads/2021/07/product-photography-lead-image_800x_0.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Text('Traditional Men sharwai',style: TextStyle(fontSize: 22),),
                  Appcontants.h10,
                  Text('Subaychatry clothings',style: TextStyle(color: Colors.grey,fontSize: 19),),
                  Appcontants.h10,
                  Text('50000',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  RatingBarIndicator(
    rating: 2.75,
    itemBuilder: (context, index) => Icon(
         Icons.star,
         color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 30.0,
    direction: Axis.horizontal,
),
                  Appcontants.h10,
                  Text('discription',style: TextStyle(fontSize: 17,),)
                  
                ],
              ),
            ),
          );
        },
      ),
      drawer: const Drawer(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
