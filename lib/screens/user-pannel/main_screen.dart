import 'package:flutter/material.dart';
import 'package:smart_shopping/utills/constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('Main Screen'),
      ),
    );
  }
}
