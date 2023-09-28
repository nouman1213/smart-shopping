import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/ge_tuser_data_controller.dart';
import '../screens/admin-pannel/admin_main_screen.dart';
import '../screens/user-pannel/main_screen.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkUserLoggedInOrNot(context);
    });
  }

  Future<void> checkUserLoggedInOrNot(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
      } else {
        Get.offAll(() => MainScreen());
      }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: Center(child: Image.asset('assets/images/main-logo.png'))),
        ],
      ),
    );
  }
}
