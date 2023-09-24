// ignore_for_file: file_names, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import 'package:smart_shopping/utills/constant.dart';
import 'package:smart_shopping/utills/custom_textfield.dart';
import 'package:smart_shopping/utills/keybord_hider.dart';

import '../controllers/forget_pass_Controller.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({super.key});

  final ForgetPassController forgetPassController =
      Get.put(ForgetPassController());
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return KeyboardHider(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: AppConst.primaryColor,
            title: const Text(
              "Forget Password",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
          body: Column(
            children: [
              isKeyboardVisible
                  ? const SizedBox.shrink()
                  : Expanded(
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
                    children: [
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Email',
                        controller: emailController,
                        sufixIcon: const Icon(
                          Icons.email_outlined,
                          size: 18,
                        ),
                        textKeyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: Get.width / 2,
                        height: Get.height / 16,
                        child: ElevatedButton(
                            child: const Text(
                              "Forget Password",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            onPressed: () async {
                              String email = emailController.text.trim();

                              if (email.isEmpty) {
                                Get.snackbar(
                                    'Error', 'Please enter all details',
                                    backgroundColor: AppConst.secondarColor,
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                String email = emailController.text.trim();

                                forgetPassController.forgetPassMethod(email);
                              }
                            }),
                      ),
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
