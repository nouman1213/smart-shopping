import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:smart_shopping/model/product_model.dart';

import '../screens/user-panel/products_details_screen.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('products')
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              child: Text("No Products Found!"),
            );
          }
          if (snapshot.data != null) {
            return SizedBox(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1),
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
                            onTap: () => Get.to(() => ProductsDetailsScreen(
                                productModel: productModel)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FillImageCard(
                                borderRadius: 10,
                                width: Get.width / 2.3,
                                heightImage: Get.height / 10,
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
                  }),
            );
          }
          return Container();
        });
  }
}
