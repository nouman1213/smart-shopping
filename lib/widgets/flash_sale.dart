import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:smart_shopping/model/product_model.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

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
            return Container(
              // color: Colors.amber,
              height: Get.height / 4.8,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
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
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FillImageCard(
                          borderRadius: 10,
                          width: Get.width / 3,
                          heightImage: Get.height / 12,
                          imageProvider: CachedNetworkImageProvider(
                              productModel.productImages[0]),
                          title: Text(
                            productModel.productName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          description: Text(
                            productModel.productDescription,
                            style: const TextStyle(fontSize: 12),
                          ),
                          footer: Row(
                            children: [
                              Text("Rs ${productModel.salePrice}"),
                              // const SizedBox(width: 5.0),
                              const Spacer(),
                              Text(
                                productModel.fullPrice,
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]);
                  }),
            );
          }
          return Container();
        });
  }
}
