import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/widgets/drawer_widget.dart';
import 'package:smart_shopping/widgets/headig_widget.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/category_widget.dart';
import '../../widgets/flash_sale.dart';
import 'all_category-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('Main Screen'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //banner widget
              BannerWidget(),
              //heading widget
              HeadingWidget(
                  headigTitle: "Categories",
                  headigSubTitle: 'According to your budgets',
                  buttonText: 'See More',
                  ontap: () => Get.to(() => const AllCategoriesScreen())),
              //category widget
              const CategoriesWidget(),
              //heading widget
              HeadingWidget(
                  headigTitle: "Flash Sale",
                  headigSubTitle: 'Low Budget',
                  buttonText: 'See More',
                  ontap: () {}),
              //Flash Sale
              const FlashSaleWidget()
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
