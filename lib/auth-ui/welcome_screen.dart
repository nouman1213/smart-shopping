import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/auth-ui/sign_In_screen.dart';
import 'package:smart_shopping/controllers/google_signin_controller.dart';
import 'package:smart_shopping/utills/constant.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FadeInUp(
                  duration: const Duration(milliseconds: 1000),
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
                          onPressed: () {
                            _googleSignInController.signInWitGoogle();
                          },
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
                          onPressed: () {
                            Get.to(() => SignInScreen());
                          },
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
