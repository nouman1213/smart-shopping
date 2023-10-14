import 'package:flutter/material.dart';
import 'package:smart_shopping/utils/constant.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primaryColor,
        title: const Text('Admin Main Screen'),
      ),
    );
  }
}
