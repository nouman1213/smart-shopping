// ignore_for_file: file_names, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/controllers/sign_up_controller.dart';
import 'package:smart_shopping/utils/constant.dart';
import 'package:smart_shopping/utils/custom_textfield.dart';
import 'package:smart_shopping/utils/keybord_hider.dart';

import '../controllers/get_device_token_controller.dart';
import 'sign_In_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SingUpController singUpController = Get.put(SingUpController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GetDeviceTokenController getDeviceTokenController =
      Get.put(GetDeviceTokenController());
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
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Center(
                              child: Image.asset(
                            'assets/images/main-logo.png',
                            scale: 1.6,
                          )))),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: AppConst.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Email',
                            controller: emailController,
                            sufixIcon: const Icon(
                              Icons.email_outlined,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.emailAddress,
                          ),
                          CustomTextField(
                            hintText: 'User Name',
                            controller: nameController,
                            sufixIcon: const Icon(
                              Icons.person_2_outlined,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.name,
                          ),
                          CustomTextField(
                            hintText: 'Phone No.',
                            controller: phoneController,
                            sufixIcon: const Icon(
                              Icons.phone_enabled_outlined,
                              size: 20,
                            ),
                            textKeyboardType: TextInputType.phone,
                          ),
                          // CustomTextField(
                          //   hintText: 'City',
                          //   controller: cityController,
                          //   sufixIcon: const Icon(
                          //     Icons.location_pin,
                          //     size: 20,
                          //   ),
                          //   textKeyboardType: TextInputType.streetAddress,
                          // ),
                          Obx(
                            () => CustomTextField(
                              obscurText:
                                  singUpController.isVisiblePassword.value,
                              hintText: 'Password',
                              controller: passwordController,
                              sufixIcon: GestureDetector(
                                onTap: () {
                                  singUpController.isVisiblePassword.toggle();
                                },
                                child: singUpController.isVisiblePassword.value
                                    ? const Icon(
                                        Icons.visibility_off,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        size: 20,
                                      ),
                              ),
                              textKeyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          // const SizedBox(height: 10),
                          const Spacer(),
                          SizedBox(
                            width: Get.width / 2,
                            height: Get.height / 16,
                            child: ElevatedButton(
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                onPressed: () async {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String phone = phoneController.text.trim();
                                  String city = cityController.text.trim();
                                  String password =
                                      passwordController.text.trim();

                                  if (name.isEmpty ||
                                      email.isEmpty ||
                                      phone.isEmpty ||
                                      city.isEmpty ||
                                      password.isEmpty) {
                                    Get.snackbar(
                                        'Error', 'Please enter all details',
                                        backgroundColor: AppConst.secondarColor,
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    UserCredential? userCredential =
                                        await singUpController.signUpMethod(
                                            email,
                                            name,
                                            phone,
                                            city,
                                            password,
                                            getDeviceTokenController.deviceToken
                                                .toString());
                                    if (userCredential != null) {
                                      Get.snackbar('Verification email sent',
                                          'Please check your email',
                                          backgroundColor:
                                              AppConst.secondarColor,
                                          snackPosition: SnackPosition.BOTTOM);
                                      FirebaseAuth.instance.signOut();
                                      Get.offAll(() => SignInScreen());
                                    }
                                  }
                                }),
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
                                onTap: () => Get.offAll(() => SignInScreen()),
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
                          // const SizedBox(height: 10),
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
