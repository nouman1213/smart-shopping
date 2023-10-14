import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        if (kDebugMode) {
          print("token : $deviceToken");
        }
        update();
      }
      update();
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", '$e',
          backgroundColor: AppConst.secondarColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
