// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/auth-ui/sign_up_screen.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/utills/custom_textfield.dart';
import 'package:smart_shopping/utills/keybord_hider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return KeyboardHider(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: AppConst.primaryColor,
            title: const Text(
              "Sign In",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
          body: Column(
            children: [
              isKeyboardVisible
                  ? const SizedBox.shrink()
                  : Expanded(
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
                    children: [
                      const CustomTextField(
                        hintText: 'Email',
                        controller: null,
                        sufixIcon: Icon(
                          Icons.email_outlined,
                          size: 18,
                        ),
                        textKeyboardType: TextInputType.emailAddress,
                      ),
                      const CustomTextField(
                        hintText: 'Password',
                        controller: null,
                        sufixIcon: Icon(
                          Icons.visibility,
                          size: 18,
                        ),
                        textKeyboardType: TextInputType.visiblePassword,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Colors.black,
                                // fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        height: Get.height / 16,
                        child: ElevatedButton(
                            child: const Text(
                              "SIGN IN",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            onPressed: () async {}),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAll(() => const SignUpScreen()),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
