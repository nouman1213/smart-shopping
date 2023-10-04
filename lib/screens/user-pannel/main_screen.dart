import 'package:flutter/material.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/widgets/drawer_widget.dart';

import '../../widgets/banner_widget.dart';

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
        child: Column(
          children: [
            const Text('data'),
            BannerWidget(),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
