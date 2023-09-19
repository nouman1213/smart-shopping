import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/utills/constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FadeInDownBig(
                  duration: const Duration(milliseconds: 1500),
                  child: Center(
                      child: Image.asset(
                    'assets/images/main-logo.png',
                    scale: 1.6,
                  )))),
          Expanded(
              child: Container(
            color: AppConst.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height / 14,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'Sign In with google',
                            style: TextStyle(fontSize: 16),
                          ),
                          icon: Image.asset(
                            'assets/images/final-google-logo.png',
                            height: Get.height / 25,
                          )),
                    ),
                  ),
                  SizedBox(height: Get.height / 40),
                  Container(
                    height: Get.height / 14,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'Sign In with email',
                            style: TextStyle(fontSize: 16),
                          ),
                          icon: const Icon(
                            Icons.email_outlined,
                            size: 35,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}