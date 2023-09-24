// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/auth-ui/sign_In_screen.dart';
import 'package:smart_shopping/utills/constant.dart';

class ForgetPassController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> forgetPassMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: 'please wait..');

      await _firebaseAuth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar("Request sent successfully", 'Please check email $userEmail',
          backgroundColor: AppConst.secondarColor,
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(() => SignInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", '$e',
          backgroundColor: AppConst.secondarColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
