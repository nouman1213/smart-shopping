// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannersController extends GetxController {
  RxList<String> bannersUrlList = RxList([]);
  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
  }

  Future<void> fetchBannersUrls() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      if (querySnapshot.docs.isNotEmpty) {
        bannersUrlList.value =
            querySnapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
