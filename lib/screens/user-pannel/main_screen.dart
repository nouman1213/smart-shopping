import 'package:flutter/material.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/widgets/drawer_widget.dart';
import 'package:smart_shopping/widgets/headig_widget.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/category_widget.dart';

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
                  headigSubTitle: 'Low Budget',
                  buttonText: 'See More',
                  ontap: () {}),
              //category widget
              CategoriesWidget(),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
