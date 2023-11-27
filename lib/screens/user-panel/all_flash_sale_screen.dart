// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:smart_shopping/screens/user-panel/single_category_prod_screen.dart';
import 'package:smart_shopping/utils/constant.dart';

import '../../model/product_model.dart';

class AllFlashSaleScreen extends StatelessWidget {
  const AllFlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('All Flash Sale Product'),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('products')
              .where('isSale', isEqualTo: true)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No Category Found!"),
              );
            }
            if (snapshot.data != null) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1.19),
                  itemBuilder: (context, index) {
                    var productsData = snapshot.data!.docs[index];
                    ProductModel productModel = ProductModel(
                      productId: productsData['productId'],
                      categoryId: productsData['categoryId'],
                      productName: productsData['productName'],
                      categoryName: productsData['categoryName'],
                      salePrice: productsData['salePrice'],
                      fullPrice: productsData['fullPrice'],
                      productImages: productsData['productImages'],
                      deliveryTime: productsData['deliveryTime'],
                      isSale: productsData['isSale'],
                      productDescription: productsData['productDescription'],
                      createdAt: productsData['createdAt'],
                      updatedAt: productsData['updatedAt'],
                    );
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() =>
                                SingleCategoriesProductScreen(
                                    categoryId: productModel.productId)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FillImageCard(
                                borderRadius: 10,
                                width: Get.width / 2.2,
                                heightImage: Get.height / 14,
                                imageProvider: CachedNetworkImageProvider(
                                    productModel.productImages[0]),
                                title: Text(
                                  productModel.productName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                description: const Text(
                                  'This is category description',
                                  style: TextStyle(fontSize: 12),
                                ),
                                // footer: const Text('desc'),
                              ),
                            ),
                          ),
                        ]);
                  });
            }
            return Container();
          }),
    );
  }
}
