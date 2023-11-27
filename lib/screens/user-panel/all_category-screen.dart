// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:smart_shopping/screens/user-panel/single_category_prod_screen.dart';
import 'package:smart_shopping/utils/constant.dart';

import '../../model/categories_model.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('All Categories'),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('categories').get(),
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
                    var categoryData = snapshot.data!.docs[index];
                    CategoriesModel categoriesModel = CategoriesModel(
                      categoryId: categoryData['categoryId'],
                      categoryImg: categoryData['categoryImg'],
                      categoryName: categoryData['categoryName'],
                      createdAt: categoryData['createdAt'],
                      updatedAt: categoryData['updatedAt'],
                    );
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() =>
                                SingleCategoriesProductScreen(
                                    categoryId: categoriesModel.categoryId)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FillImageCard(
                                borderRadius: 10,
                                width: Get.width / 2.2,
                                heightImage: Get.height / 14,
                                imageProvider: CachedNetworkImageProvider(
                                    categoriesModel.categoryImg),
                                title: Text(
                                  categoriesModel.categoryName,
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
