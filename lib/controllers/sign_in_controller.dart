import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/utills/constant.dart';

class SingInController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RxBool isVisiblePassword = true.obs;

  // sign in method

  Future<UserCredential?> signInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: 'please wait..');
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", '$e',
          backgroundColor: AppConst.secondarColor,
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
