// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/model/product_model.dart';
import 'package:smart_shopping/utils/constant.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductModel productModel;
  ProductsDetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('Products Details '),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CarouselSlider(
                items: productModel.productImages
                    .map((imageUrl) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: Get.width - 10,
                            placeholder: (context, url) => const ColoredBox(
                              color: Colors.white,
                              child: Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    aspectRatio: 2.5,
                    viewportFraction: 2)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            productModel.productName,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined))
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'PKR  ${productModel.fullPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Category  ${productModel.categoryName},',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        productModel.productDescription,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: Get.width / 2,
                      height: Get.height / 18,
                      decoration: BoxDecoration(
                          color: AppConst.primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
