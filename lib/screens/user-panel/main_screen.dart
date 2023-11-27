import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/screens/user-panel/all_flash_sale_screen.dart';
import 'package:smart_shopping/utils/constant.dart';
import 'package:smart_shopping/widgets/all_products_widgets.dart';
import 'package:smart_shopping/widgets/drawer_widget.dart';
import 'package:smart_shopping/widgets/headig_widget.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/category_widget.dart';
import '../../widgets/flash_sale.dart';
import 'all_category-screen.dart';
import 'all_products_screen.dart';

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
                  ontap: () => Get.to(() => const AllFlashSaleScreen())),
              //Flash Sale
              const FlashSaleWidget(),
              HeadingWidget(
                  headigTitle: "All Products",
                  headigSubTitle: 'Low Budget',
                  buttonText: 'See More',
                  ontap: () => Get.to(() => const AllProductsScreen())),
              const AllProductsWidget(),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
