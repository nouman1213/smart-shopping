// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/utills/custom_textfield.dart';
import 'package:smart_shopping/utills/keybord_hider.dart';

import 'sign_In_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return KeyboardHider(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: AppConst.primaryColor,
            title: const Text(
              "Sign Up",
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
                  flex: 2,
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
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.emailAddress,
                          ),
                          const CustomTextField(
                            hintText: 'User Name',
                            controller: null,
                            sufixIcon: Icon(
                              Icons.person_2_outlined,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.name,
                          ),
                          const CustomTextField(
                            hintText: 'Phone No.',
                            controller: null,
                            sufixIcon: Icon(
                              Icons.phone_enabled_outlined,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.phone,
                          ),
                          const CustomTextField(
                            hintText: 'City',
                            controller: null,
                            sufixIcon: Icon(
                              Icons.location_pin,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.streetAddress,
                          ),
                          const CustomTextField(
                            hintText: 'Password',
                            controller: null,
                            sufixIcon: Icon(
                              Icons.visibility,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: Get.width / 2,
                            height: Get.height / 16,
                            child: ElevatedButton(
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                onPressed: () async {}),
                          ),
                          // SizedBox(height: Get.height / 20),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Get.offAll(() => const SignInScreen()),
                                child: const Text(
                                  "Sign In",
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
