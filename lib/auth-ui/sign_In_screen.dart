// ignore_for_file: file_names, must_be_immutable, unnecessary_null_comparison

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/auth-ui/forget_pass_screen.dart';
import 'package:smart_shopping/auth-ui/sign_up_screen.dart';
import 'package:smart_shopping/controllers/sign_in_controller.dart';
import 'package:smart_shopping/screens/user-panel/main_screen.dart';
import 'package:smart_shopping/utils/constant.dart';
import 'package:smart_shopping/utils/custom_textfield.dart';
import 'package:smart_shopping/utils/keybord_hider.dart';

import '../controllers/get_user_data_controller.dart';
import '../screens/admin-panel/admin_main_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SingInController singInController = Get.put(SingInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
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
                          CustomTextField(
                            hintText: 'Email',
                            controller: emailController,
                            sufixIcon: const Icon(
                              Icons.email_outlined,
                              size: 18,
                            ),
                            textKeyboardType: TextInputType.emailAddress,
                          ),
                          Obx(
                            () => CustomTextField(
                              obscurText:
                                  singInController.isVisiblePassword.value,
                              hintText: 'Password',
                              controller: passwordController,
                              sufixIcon: GestureDetector(
                                onTap: () {
                                  singInController.isVisiblePassword.toggle();
                                },
                                child: Icon(
                                  singInController.isVisiblePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 18,
                                ),
                              ),
                              textKeyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => ForgetPassScreen());
                              },
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                onPressed: () async {
                                  String email = emailController.text.trim();

                                  String password =
                                      passwordController.text.trim();

                                  if (email.isEmpty || password.isEmpty) {
                                    Get.snackbar(
                                        'Error', 'Please enter all details',
                                        backgroundColor: AppConst.secondarColor,
                                        snackPosition: SnackPosition.BOTTOM);
                                  } else {
                                    UserCredential? userCredential =
                                        await singInController.signInMethod(
                                            email, password);

                                    var userData = await getUserDataController
                                        .getUserData(userCredential!.user!.uid);
                                    if (userCredential != null) {
                                      if (userCredential.user!.emailVerified) {
                                        if (userData[0]['isAdmin'] == true) {
                                          Get.offAll(() => const AdminMainScreen());
                                          Get.snackbar('Success',
                                              'Admin login sucessfully',
                                              backgroundColor:
                                                  AppConst.secondarColor,
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {
                                          Get.snackbar('Success',
                                              'User login sucessfully',
                                              backgroundColor:
                                                  AppConst.secondarColor,
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                          Get.offAll(() => const MainScreen());
                                        }
                                      } else {
                                        Get.snackbar('Error',
                                            'Please verify email before sign in',
                                            backgroundColor:
                                                AppConst.secondarColor,
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      }
                                    } else {
                                      Get.snackbar('Error', 'Please try again',
                                          backgroundColor:
                                              AppConst.secondarColor,
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  }
                                }),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () => Get.offAll(() => SignUpScreen()),
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
