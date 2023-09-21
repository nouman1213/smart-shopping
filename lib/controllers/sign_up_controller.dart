import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_shopping/model/user-model.dart';
import 'package:smart_shopping/utills/constant.dart';

class SingUpController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isVisiblePassword = true.obs;

  // sign up method

  Future<UserCredential?> signUpMethod(
    String userEmail,
    String userName,
    String userPhone,
    String userCity,
    String userPassword,
    String deviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'please wait..');
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      // send email vaerification
      await userCredential.user!.sendEmailVerification();

      // store userData in model
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: deviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity);

      // add data into firestore database

      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
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
