import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:smart_shopping/model/categories_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
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
              child: Text("No Category Found!"),
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
                    var doc = snapshot.data!.docs[index];
                    CategoriesModel categoriesModel = CategoriesModel(
                      categoryId: doc['categoryId'],
                      categoryImg: doc['categoryImg'],
                      categoryName: doc['categoryName'],
                      createdAt: doc['createdAt'],
                      updatedAt: doc['updatedAt'],
                    );
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FillImageCard(
                          borderRadius: 10,
                          width: Get.width / 3,
                          heightImage: Get.height / 12,
                          imageProvider: CachedNetworkImageProvider(
                              categoriesModel.categoryImg),
                          title: Text(
                            categoriesModel.categoryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          description: const Text(
                            'This is category description',
                            style: TextStyle(fontSize: 12),
                          ),
                          // footer: const Text('desc'),
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
